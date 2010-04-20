/usr/local/mysql/bin/mysql -h localhost -u root -p < createDBs.sql  # the -p causes password query for password associated with MySQL admin
rake db:migrate