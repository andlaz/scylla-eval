#!/usr/bin/env bash
stressOut=`cat`
fileName=$1

results=${stressOut##*Results:}

latencies50th=$(echo -e $results | grep -Po 'latency median : \K[^\]]+')
latencies95th=$(echo -e $results | grep -Po 'latency 95th percentile : \K[^\]]+')
latencies99th=$(echo -e $results | grep -Po 'latency 99th percentile : \K[^\]]+')
operationTime=$(echo -e $results | grep -Po 'Total operation time : \K(\d{2}:\d{2}:\d{2})+')

# for every parameter to this script (query names) draw the histogram

for queryName in "${@:2}"
do
	latency50th=$(echo $latencies50th | grep -Po $queryName':\K(\d*\.?[0-9]+)')
	latency95th=$(echo $latencies95th | grep -Po $queryName':\K(\d*\.?[0-9]+)')
	latency99th=$(echo $latencies99th | grep -Po $queryName':\K(\d*\.?[0-9]+)')
	
	# plot latency
	latency="50 "$latency50th"\n95 "$latency95th"\n99 "$latency99th
	echo "Plotting latency histogram ("$latency")"
	echo -e $latency | gnuplot -p -e "set term png; set output 'latency-"$1"-"$queryName".png'; plot '< cat -' using 1:2 with lines"
	
done