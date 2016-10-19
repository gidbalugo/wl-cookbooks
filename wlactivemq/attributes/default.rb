default['activemq']['mirror']  = "http://apache.mirrors.tds.net"
default['activemq']['version'] = "5.13.4"
default['activemq']['home']  = "/opt"
default['activemq']['wrapper']['max_memory'] = "512"
default['activemq']['wrapper']['useDedicatedTaskRunner'] = "true"

#zookeeper addresses
default['activemq']['zooKeeper']['port'] = "2181"
default['activemq']['zooKeeper']['address1'] = "10.8.1.183"
default['activemq']['zooKeeper']['address2'] = "10.8.3.152"
default['activemq']['zooKeeper']['address3'] = "10.8.1.53"

#default to 0.0.0.0
default['activemq']['hostname'] = "0.0.0.0"
