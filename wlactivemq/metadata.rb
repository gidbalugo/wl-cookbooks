name 'wlactivemq'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures wlactivemq'
long_description 'Installs/Configures wlactivemq'
version          "0.1.0"

%w{ubuntu debian redhat centos}.each do |os|
  supports os
end

depends 'java'

