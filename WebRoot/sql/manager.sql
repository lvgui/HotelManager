--��
create table manager(
id  number(8) primary key,
name varchar2(20) not null unique,
password varchar2(20) not null
)
--����
create  sequence manager_id 
increment by 1
start with 1
nomaxvalue
nocycle
--������
CREATE OR REPLACE TRIGGER manager_before_insert
BEFORE INSERT ON manager
FOR EACH ROW
BEGIN
SELECT manager_id.NEXTVAL INTO :new.id FROM dual;
END;
--ԭʼ����
insert into manager(name,password) values('��ϣ','12');
insert into manager(name,password) values('Ů��','12');
