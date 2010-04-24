/usr/local/mysql/bin/mysql -h localhost -u root -p < createDBs.sql  # the -p causes password query for password associated with MySQL admin, right now, don't have one, so hit <enter>
rake db:migrate