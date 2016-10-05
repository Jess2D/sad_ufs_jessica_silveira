CREATE DATABASE IF NOT EXISTS teste;

USE teste;
drop table alimentos;

CREATE TABLE alimentos (
  ID_GRUPO varchar(3) NOT NULL default '',
  Descricao varchar(45) NOT NULL default '',
  ID_ALIMENTO varchar(3) NOT NULL default '',
  alimento varchar(45) NOT NULL default ''

);


select *
from alimentos