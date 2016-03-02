name 'snap-a-matic-15000'
maintainer 'Tom Fisken'
maintainer_email 'tfisken@gannett.com'
license 'All rights reserved'
description 'Installs/Configures snapa'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

depends 'gdp-base-linux', '= 1.4.6'
depends 'uwsgi-application', '>= 2.0'
depends 'couchbase', '= 4.0.2'

supports 'centos'
