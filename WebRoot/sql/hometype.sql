--��������
create table hometype(
id  number(8) primary key,
name varchar2(20) not null unique
)
--����
create  sequence hometype_id 
increment by 1
start with 1
nomaxvalue
nocycle
--������
CREATE OR REPLACE TRIGGER hometype_before_insert
BEFORE INSERT ON hometype
FOR EACH ROW
BEGIN
SELECT hometype_id.NEXTVAL INTO :new.id FROM dual;
END;
--ԭʼ����
insert into hometype(name) values('���Է�');
insert into hometype(name) values('�齫��');
