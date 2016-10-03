This is a small shell script and a docker image to run & plot the results of cassandra-stress. There is ```-graph``` available after Cassandra 3.2, however, this is specifically for plotting the cassandra-stress fork bundled in Scylladb together with any other cassandra-stress version.

### Environment
A docker image is available under ```scylla-benchmark``` to set up the benchmarking host environment. It installs ```scylla-tools``` and downloads Cassandra version 3.0.6 tarball and other dependencies ( java, gnuplot.. )

It also clones this repository for access to the cassandra-stress yaml and other scripts.

### Schema & queries
We will be benchmarking a classic time-series schema with a typical OLTP query.

### How to run the benchmarks

- install a Scylla and a Cassandra cluster.
- start up a container from the scylla-benchmark Docker image
- run the below ```cassandra-stress``` command in the container


    cassandra-stress user profile=/scylla-eval/timeseries.yaml n=100000 ops\(insert=9,read1=1\) no-warmup cl=ONE -node 10.42.60.4 -rate threads=16 | ./plot.sh scylla insert read1
    
The parameters to plot.sh are (1) a name to construct the graph with, and the names of the queries from the yaml file to plot.