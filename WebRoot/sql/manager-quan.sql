--��
create table managerquan(
id  number(8) primary key,
name varchar2(20) not null unique,
quan number(2) default 1
)
--����
create  sequence managerquan_id 
increment by 1
start with 1
nomaxvalue
nocycle
--������
CREATE OR REPLACE TRIGGER managerquan_before_insert
BEFORE INSERT ON managerquan
FOR EACH ROW
BEGIN
SELECT managerquan_id.NEXTVAL INTO :new.id FROM dual;
END;
--ԭʼ����
insert into managerquan(name,quan) values('��ϣ',1);
insert into managerquan(name,quan) values('Ů��',2);
