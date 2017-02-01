# Change default values
default['bach_ambari_views']['ambari_username'] = "ambari-server-#{node.chef_environment}"
# Ambari properties
node.override['ambari-chef']['webhcat.hostname'] = 'u1203.ambari.apache.org'
node.override['ambari-chef']['yarn.ats.url'] = 'http://u1202.ambari.apache.org:8188'
node.override['ambari-chef']['oozie.service.uri'] = 'http://u1203.ambari.apache.org:11000/oozie'
node.override['ambari-chef']['yarn.resourcemanager.url'] = 'u1202.ambari.apache.org:8088'
node.override['ambari-chef']['webhcat.hostname'] = 'u1203.ambari.apache.org'
node.override['ambari-chef']['ambari_server_host'] = 'servername.ambari.apache.org'
node.override['ambari-chef']['hive.host'] =  'u1203.ambari.apache.org'
node.override['ambari-chef']['ambari_views_url'] = 'http://default-ubuntu-1404:8080/api/v1/views'
node.override['ambari-chef']['ambari_database_password'] = 'bigdata'
node.override['ambari-chef']['java_home'] = node['bcpc']['hadoop']['java']
node.override['ambari-chef']['webhdfs.ha.namenode.http-address.nn1'] = 'u1201.ambari.apache.org:50070'
node.override['ambari-chef']['webhdfs.ha.namenode.http-address.nn2'] = 'u1202.ambari.apache.org:50070'
node.override['ambari-chef']['webhdfs.ha.namenode.https-address.nn1'] = 'u1201.ambari.apache.org:50470'
node.override['ambari-chef']['webhdfs.ha.namenode.https-address.nn2'] = 'u1202.ambari.apache.org:50470'
node.override['ambari-chef']['webhdfs.ha.namenode.rpc-address.nn1'] = 'u1201.ambari.apache.org:8020'
node.override['ambari-chef']['webhdfs.ha.namenode.rpc-address.nn2'] = 'u1202.ambari.apache.org:8020'
node.override['ambari-chef']['webhdfs.ha.namenodes.list'] = 'nn1,nn2'
node.override['ambari-chef']['webhdfs.nameservices'] = 'hacluster'
node.override['ambari-chef']['webhdfs.url'] = 'webhdfs://hacluster'

# use 'SIMPLE' for non-Kerberos cluster
node.override['ambari-chef']['webhdfs.auth'] = \
  'auth=KERBEROS;proxyuser=#{node['bach_ambari_views']['ambari_username']}
node.override['ambari-chef']['fs.defaultFS'] = node['bcpc']['hadoop']['hdfs_url']
node.override['ambari-chef']['hive.http.path'] = 'cliservice'
node.override['ambari-chef']['hive.http.port'] = '9083'
node.override['ambari-chef']['hive.metastore.warehouse.dir'] = '/user/hive/warehouse'
node.override['ambari-chef']['hive.port'] = node["bcpc"]["hadoop"]["hive"]["server2"]["port"]
node.override['ambari-chef']['webhcat.port'] = node["bcpc"]["hadoop"]["hive"]["server2"]["port"] 
node.override['ambari-chef']['hadoop.security.authentication'] = \
  node[:bcpc][:hadoop][:kerberos][:enable] ? 'KERBEROS' : 'SIMPLE' 
