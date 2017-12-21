drop table tasks2;
select * from todoshka.tasks2;
CREATE TABLE tasks2(
   id INT NOT NULL AUTO_INCREMENT,
   task_name VARCHAR(20) NOT NULL,
   description VARCHAR(100) NOT NULL,
   priority enum('LOW', 'MEDIUM', 'HIGH', 'IMPORTANT'),
   data_create date not null default '0000-00-00',
   done tinyint(1) NOT NULL default 0,
   deleted tinyint(1) NOT NULL default 0,
   PRIMARY KEY (id)
);

SELECT * FROM tasks2 WHERE done=0 AND deleted=0;

SELECT * FROM tasks2 WHERE done=1;

SELECT * FROM tasks2 WHERE deleted=1;

insert into tasks2(task_name,description,priority,data_create,done,deleted) 
values ("Task_1","do something","LOW",'2017-12-12',0,0);
insert into tasks2(task_name,description,priority,data_create,done,deleted) 
values ("Task_2","do something","MEDIUM",'2017-12-13',1,0);
insert into tasks2(task_name,description,priority,data_create,done,deleted) 
values ("Task_3","do something","LOW",'2017-12-11',0,1);
insert into tasks2(task_name,description,priority,data_create,done,deleted) 
values ("Task_4","do something","HIGH",'2017-12-10',1,0);
insert into tasks2(task_name,description,priority,data_create,done,deleted) 
values ("Task_5","do something","HIGH",'2017-12-12',1,0);
insert into tasks2(task_name,description,priority,data_create,done,deleted) 
values ("Task_6","do something","IMPORTANT",'2017-12-11',0,0);
insert into tasks2(task_name,description,priority,data_create,done,deleted) 
values ("Task_7","do something","HIGH",'2017-12-11',0,1);
insert into tasks2(task_name,description,priority,data_create,done,deleted) 
values ("Task_8","do something","LOW",'2017-12-12',1,0);
insert into tasks2(task_name,description,priority,data_create,done,deleted) 
values ("Task_9","do something","IMPORTANT",'2017-12-10',0,1);
insert into tasks2(task_name,description,priority,data_create,done,deleted) 
values ("Task_10","do something","IMPORTANT",'2017-12-12',0,1);
insert into tasks2(task_name,description,priority,data_create,done,deleted) 
values ("Task_11","do something","MEDIUM",'2017-12-12',0,0);