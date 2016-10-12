#
#
#
#

default['zookeeper']['mirror']  = "http://apache.mirrors.tds.net"
default['zookeeper']['version'] = "3.4.9"
default['zookeeper']['home']  	= "/opt"
default['zookeeper']['dataDir'] = "/var/zookeeper"

#zookeeper ids - values do not necessarily comply with id-X
#zookeeper address are from the created instance in aws
default['zookeeper']['id1'] 	  = "1"
default['zookeeper']['address1'] = "54.197.36.162"
default['zookeeper']['private1'] = "172.31.38.64"

default['zookeeper']['id2']	  = "2"
default['zookeeper']['address2'] = "54.166.52.11"
default['zookeeper']['private2'] = "172.31.36.224"

default['zookeeper']['id3'] 	  = "3"
default['zookeeper']['address3'] = "54.172.199.170"
default['zookeeper']['private3'] = "172.31.47.51"

#default myid is. this is updated by recipe depending on private ip
default['zookeeper']['myid'] = "1"

#default['zookeeper']['wrapper']['max_memory'] = "512"
#default['zookeeper']['wrapper']['useDedicatedTaskRunner'] = "true"