--房间表
create table customer(
id  number(8) primary key,
name varchar2(20) not null,
credentialstype varchar2(255) not null,
credentialsnum varchar2(255) not null unique
)
--序列 + 触发器
--序列
create  sequence customer_id 
increment by 1
start with 1
nomaxvalue
nocycle
--触发器
CREATE OR REPLACE TRIGGER customer_before_insert
BEFORE INSERT ON customer
FOR EACH ROW
BEGIN
SELECT customer_id.NEXTVAL INTO :new.id FROM dual;
END;
--原始数据
insert into customer(name,credentialstype,credentialsnum) values('艾希','身份卡','03121032135');
insert into customer(name,credentialstype,credentialsnum) values('女警','身份卡','1385135115');



