USE FOREST;

DROP table IF exists RAINFOREST;

create table RAINFOREST
(
  FOREST_NAME varchar(40),
  LOCATION varchar(40),
  area INT,
  acronym char(3),

  primary key (acronym)

);

show tables;
