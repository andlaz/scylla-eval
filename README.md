This is a small shell script and a docker image to run & plot the results of cassandra-stress. There is ```-graph``` available after Cassandra 3.2, however, this is specifically for plotting the cassandra-stress fork bundled in Scylladb together with any other cassandra-stress version.

### Environment
A docker image is available under ```scylla-benchmark``` to set up the benchmarking host environment. It installs ```scylla-tools``` and downloads Cassandra version 3.0.6 tarball and other dependencies ( java, gnuplot.. )

It also clones this repository for access to the cassandra-stress yaml and other scripts.

### Schema & queries
We will be benchmarking a classic time-series schema with a typical OLTP query.

### How to run the benchmarks

- install a Scylla and a Cassandra cluster.
- start up a container from the scylla-benchmark Docker image
- run the below ```cassandra-stress``` command in the container. Note that the executable on $PATH is the one from the scylla-tools package, the cassandra 3.0.6 one is available under ```/apache-cassandra-3.0.6/tools/bin/```
- you may want to mount a folder from the host system to /benchmark in the container


    ```docker run --volume ~/:/benchmark --rm -ti andlaz/scylla-eval /bin/bash -c 'cassandra-stress user profile=/scylla-eval/timeseries.yaml n=100000 ops\(insert=9,read1=1\) no-warmup cl=ONE -node contact_node_here -rate threads=16 | (cd /benchmark && /scylla-eval/plot.sh scylla insert read1)'```
    
The parameters to plot.sh are (1) a name to construct the graph with, and (2..) the names of the queries from the yaml file to plot.

Currently, two images will be written for the latencies of the supplied queries.

TODO: throughput
