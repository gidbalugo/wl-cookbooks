#
#
#
#

default['zookeeper']['mirror']  = "http://apache.mirrors.tds.net"
default['zookeeper']['version'] = "3.4.9"
default['zookeeper']['home']  	= "/opt"
default['zookeeper']['dataDir'] = "/var/zookeeper"

#zookeeper ids - values do not necessarily comply with idX
#zookeeper address are from the created instance in aws
default['zookeeper']['id1'] 	  			= "1"
default['zookeeper']['private1'] 			= "172.31.41.188"
default['zookeeper']['instance']['address1']= "54.205.121.180"
default['zookeeper']['config']['address1'] 	= "54.205.121.180"


default['zookeeper']['id2']	  				= "2"
default['zookeeper']['private2'] 			= "172.31.34.123"
default['zookeeper']['instance']['address2']= "54.88.31.216"
default['zookeeper']['config']['address2'] 	= "54.88.31.216"

default['zookeeper']['id3'] 	  			= "3"
default['zookeeper']['private3'] 			= "172.31.34.129"
default['zookeeper']['instance']['address3']= "54.161.93.138"
default['zookeeper']['config']['address3']  = "54.161.93.138"

#default myid for config is 1 or whatever
default['zookeeper']['myid'] = "1"

#default['zookeeper']['wrapper']['max_memory'] = "512"
#default['zookeeper']['wrapper']['useDedicatedTaskRunner'] = "true"