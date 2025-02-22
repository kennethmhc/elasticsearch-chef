name             "elastic"
maintainer       "Jim Dowling"
maintainer_email "jdowling@kth.se"
license          "Apache v2.0"
description      'Installs/Configures/Runs opensearch'
version          "3.5.0"

recipe            "elastic::install", "Experiment setup for opensearch"
recipe            "elastic::default",  "Configures and starts an opensearch server"
recipe            "elastic::purge",  "Deletes an opensearch server"


depends "ulimit2", '~> 0.2.0'
depends "sysctl", '~> 1.0.3'
depends "ark", '= 5.1.1'
depends "yum", '= 6.1.1'
depends 'conda'
depends 'kagent'
depends 'ndb'
depends "java"


%w{ ubuntu debian rhel centos }.each do |os|
  supports os
end

attribute "elastic/port",
          :description =>  "Port for opensearch service (default: 9200)",
          :type => 'string'

attribute "elastic/bind_host",
          :description =>  "IP on which to bind Opensearch (Default: 0.0.0.0)",
          :type => 'string'

attribute "elastic/ulimit_files",
          :description =>  "Number of files to set ulimit to.",
          :type => 'string'

attribute "elastic/ulimit_memlock",
          :description =>  "Memlock size for ulimit",
          :type => 'string'

attribute "elastic/user",
          :description =>  "User to install elastic as.",
          :type => 'string'

attribute "elastic/user_id",
          :description =>  "Elastic user ID. Default: 1501",
          :type => 'string'

attribute "elastic/user-home",
          :description =>  "Home directory of elastic user",
          :type => 'string'

attribute "elastic/elk-user",
          :description =>  "Administrator user for ELK stack.",
          :type => 'string'

attribute "elastic/elk-user_id",
          :description =>  "ELK stack admin user ID. Default: 1502",
          :type => 'string'

attribute "elastic/elk-home",
          :description =>  "Home directory of elastic admin user",
          :type => 'string'

attribute "elastic/group",
          :description =>  "Group to install elastic as.",
          :type => 'string'

attribute "elastic/group_id",
          :description =>  "Elastic group ID. Default: 1501",
          :type => 'string'

attribute "elastic/elk-group",
          :description =>  "Group for ELK admin user.",
          :type => 'string'

attribute "elastic/elk-group_id",
          :description =>  "ELK admin group ID. Default: 1502",
          :type => 'string'

attribute "elastic/dir",
          :description =>  "Base directory to install elastic search into.",
          :type => 'string'

attribute "elastic/data_dir",
          :description =>  "Directory to store elastic data.",
          :type => 'string'

attribute "elastic/backup_dir",
          :description =>  "Directory to store elastic backup snapshots.",
          :type => 'string'

attribute "elastic/memory/Xms",
          :description =>  "Amount of minimum heap memory for Opensearch. Default '512m'.",
          :type => 'string'

attribute "elastic/memory/Xmx",
          :description =>  "Amount of maximum heap memory for Opensearch. Default: '1024m'.",
          :type => 'string'

attribute "elastic/cluster/max_shards_per_node",
          :description =>  "Amount of maximum shards per node.",
          :type => 'string'

attribute "elastic/version",
          :description =>  "Opensearch version, .e.g, '1.2.4'",
          :type => 'string'

attribute "elastic/checksum",
          :description =>  "Sha-512 checksum for the opensearch .tar.gz file",
          :type => 'string'

attribute "elastic/default/private_ips",
          :description => "Set ip addresses",
          :type => "array"

attribute "elastic/default/public_ips",
          :description => "Set ip addresses",
          :type => "array"

attribute "install/dir",
          :description => "Set to a base directory under which we will install.",
          :type => "string"

attribute "install/user",
          :description => "User to install the services as",
          :type => "string"

attribute "elastic/projects/reindex",
          :description => "Delete and reindex the projects index",
          :type => "string"

attribute "elastic/featurestore/reindex",
          :description => "Delete and reindex the featurestore index",
          :type => "string"

attribute "elastic/master",
          :description =>  "Master eligible node. Default is true.",
          :type => 'string'

attribute "elastic/data",
          :description =>  "Data node. Default is true.",
          :type => 'string'

attribute "elastic/snapshot/type",
          :description =>  "Type of snapshot repository. Valid values are S3 and none. Default: none",
          :type => 'string'

attribute "elastic/snapshot/s3/access_key_id",
          :description =>  "Access key ID to S3 bucket. Default: Hops access key ID",
          :type => 'string'

attribute "elastic/snapshot/s3/secret_access_key",
          :description =>  "Secret access key to S3 bucket. Default: Hops secret access key",
          :type => 'string'

attribute "elastic/snapshot/s3/session_token",
          :description =>  "Optionally supply a session token for S3 bucket. Default: none",
          :type => 'string'

attribute "elastic/snapshot/s3/endpoint",
          :description =>  "Override endpoint for S3 bucket. Default: Hops endpoint",
          :type => 'string'

attribute "elastic/snapshot/indices",
          :description =>  "Regular expression of indices to snapshot. Default: *file_prov,app_provenance",
          :type => 'string'

attribute "elastic/snapshot/restore/id",
          :description =>  "Snapshot ID to restore. Default: empty",
          :type => 'string'

attribute "elastic/opensearch_security/admin/username",
          :description =>  "Admin username for Opensearch security.",
          :type => 'string'

attribute "elastic/opensearch_security/admin/password",
          :description =>  "Admin password for Opensearch security.",
          :type => 'string'

attribute "elastic/opensearch_security/kibana/username",
          :description =>  "Username used by kibana to interact with Opensearch.",
          :type => 'string'

attribute "elastic/opensearch_security/kibana/password",
          :description =>  "Password used by kibana to interact with Opensearch.",
          :type => 'string'

attribute "elastic/opensearch_security/logstash/username",
          :description =>  "Username used by logstash to interact with Opensearch.",
          :type => 'string'

attribute "elastic/opensearch_security/logstash/password",
          :description =>  "Password used by logstash to interact with Opensearch.",
          :type => 'string'

attribute "elastic/opensearch_security/epipe/username",
          :description =>  "Username used by epipe to interact with Opensearch.",
          :type => 'string'

attribute "elastic/opensearch_security/epipe/password",
          :description =>  "Password used by epipe to interact with Opensearch.",
          :type => 'string'

attribute "elastic/opensearch_security/elastic_exporter/username",
          :description =>  "Username used by elastic_exporter to interact with Opensearch.",
          :type => 'string'

attribute "elastic/opensearch_security/elastic_exporter/password",
          :description =>  "Password used by elastic_exporter to interact with Opensearch.",
          :type => 'string'

attribute "elastic/opensearch_security/service_log_viewer/username",
          :description =>  "Username of the user viewing service logs",
          :type => 'string'

attribute "elastic/opensearch_security/service_log_viewer/password",
          :description =>  "Password of the user viewing service logs",
          :type => 'string'

attribute "elastic/opensearch_security/jwt/exp_ms",
          :description =>  "The expiration time in milliseconds for a jwt token generated for Opensearch security.",
          :type => 'string'

attribute "elastic/opensearch_security/audit/enable_rest",
          :description =>  "Enable or disable audit on the REST API. Default is true.",
          :type => 'string'

attribute "elastic/opensearch_security/audit/enable_transport",
          :description =>  "Enable or disable audit on the transport layer. Default is false.",
          :type => 'string'

attribute "elastic/knn/enabled",
          :description =>  "Default: true",
          :type => 'string'

attribute "elastic/knn/index_threads",
          :description =>  "Default: 1",
          :type => 'string'

attribute "elastic/knn/cache_expire/enabled",
          :description =>  "Default: false",
          :type => 'string'

attribute "elastic/knn/circuit_breaker/percent",
          :description =>  "Default: 75%",
          :type => 'string'

attribute "elastic/knn/circuit_breaker/triggered",
          :description =>  "Default: false",
          :type => 'string'

attribute "elastic/knn/memory_circuit_breaker/limit",
          :description =>  "Default: 50%",
          :type => 'string'

attribute "elastic/knn/memory_circuit_breaker/enabled",
          :description =>  "Default: true",
          :type => 'string'


