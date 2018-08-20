--表
create table manager(
id  number(8) primary key,
name varchar2(20) not null unique,
password varchar2(20) not null
)
--序列
create  sequence manager_id 
increment by 1
start with 1
nomaxvalue
nocycle
--触发器
CREATE OR REPLACE TRIGGER manager_before_insert
BEFORE INSERT ON manager
FOR EACH ROW
BEGIN
SELECT manager_id.NEXTVAL INTO :new.id FROM dual;
END;
--原始数据
insert into manager(name,password) values('艾希','12');
insert into manager(name,password) values('女警','12');
