drop database if exists mashup_development;
create database mashup_development;
drop database if exists mashup_test;
create database mashup_test;
drop database if exists mashup_production;
create database mashup_production;
GRANT ALL PRIVILEGES ON mashup_development.* TO 'mashup'@'localhost'
  IDENTIFIED BY 'secret!' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON mashup_test.* TO 'mashup'@'localhost'
  IDENTIFIED BY 'secret!' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON mashup_production.* TO 'mashup'@'localhost'
  IDENTIFIED BY 'secret!' WITH GRANT OPTION;