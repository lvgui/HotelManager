--房间类别表
create table hometype(
id  number(8) primary key,
name varchar2(20) not null unique
)
--序列
create  sequence hometype_id 
increment by 1
start with 1
nomaxvalue
nocycle
--触发器
CREATE OR REPLACE TRIGGER hometype_before_insert
BEFORE INSERT ON hometype
FOR EACH ROW
BEGIN
SELECT hometype_id.NEXTVAL INTO :new.id FROM dual;
END;
--原始数据
insert into hometype(name) values('电脑房');
insert into hometype(name) values('麻将房');
