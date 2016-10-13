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
default['zookeeper']['private1'] 			= "172.31.36.128"
default['zookeeper']['instance']['address1']= "54.235.3.213"
default['zookeeper']['config']['address1'] 	= "54.235.3.213"


default['zookeeper']['id2']	  				= "2"
default['zookeeper']['private2'] 			= "172.31.38.216"
default['zookeeper']['instance']['address2']= "52.23.211.26"
default['zookeeper']['config']['address2'] 	= "52.23.211.26"

default['zookeeper']['id3'] 	  			= "3"
default['zookeeper']['private3'] 			= "172.31.42.157"
default['zookeeper']['instance']['address3']= "54.235.4.26"
default['zookeeper']['config']['address3']  = "54.235.4.26"

#default myid for config is 1 or whatever
default['zookeeper']['myid'] = "1"

#default['zookeeper']['wrapper']['max_memory'] = "512"
#default['zookeeper']['wrapper']['useDedicatedTaskRunner'] = "true"