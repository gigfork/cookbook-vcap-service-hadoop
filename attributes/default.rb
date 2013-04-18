include_attribute "deployment"

default[:hadoop][:supported_versions] = {
        "1.1.2" => "1.1.2",
}
default[:hadoop][:version_aliases] = {
        "current" => "1.1.2",
}
default[:hadoop][:default_version] = "1.1.2"
default[:hadoop][:host] = "localhost"

default[:hadoop][:id] = "eyJzaWciOiJRR3o1cnVZUGFzQ1gxVTNCZFZiQ3pZcUdTbU09Iiwib2lkIjoi%0ANGU0ZTc4YmNhNTFlMTIyMDA0ZTRlOGVjNjg0MDc3MDUwMTlmMGJhYWMxODki%0AfQ==%0A"
default[:hadoop][:path] = File.join(node[:deployment][:home], "deploy", "hadoop")

default[:hadoop_gateway][:service][:timeout] = "60"
default[:hadoop_gateway][:node_timeout] = "60"

default[:hadoop_node][:capacity] = "5"
default[:hadoop_node][:index] = "0"
default[:hadoop_node][:max_memory] = "512"
default[:hadoop_node][:token] = "changehadooptoken"
default[:hadoop_node][:op_time_limit] = "60"

default[:hadoop][:checksum] = '2a82ba1611eff607c5c1894485c4c6775a953682f1b7cf60e8519fad5bd2d582'
