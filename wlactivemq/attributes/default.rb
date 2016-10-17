default['activemq']['mirror']  = "http://apache.mirrors.tds.net"
default['activemq']['version'] = "5.13.4"
default['activemq']['home']  = "/opt"
default['activemq']['wrapper']['max_memory'] = "512"
default['activemq']['wrapper']['useDedicatedTaskRunner'] = "true"

#zookeeper addresses
default['activemq']['zooKeeper']['port'] = "2181"
default['activemq']['zooKeeper']['address1'] = "52.201.217.58"
default['activemq']['zooKeeper']['address2'] = "54.86.52.71"
default['activemq']['zooKeeper']['address3'] = "54.234.16.192"

#default to 0.0.0.0
default['activemq']['hostname'] = "0.0.0.0"
