--�����
create table home(
id  number(8) primary key,
num varchar2(20),
type varchar2(20),
status number(2),
prices number(8,2),
discount number(3,2),
images varchar2(255) default 'fang.jpg'
)
--���� + ������
--����
create  sequence home_id 
increment by 1
start with 1
nomaxvalue
nocycle
--������
CREATE OR REPLACE TRIGGER home_before_insert
BEFORE INSERT ON home
FOR EACH ROW
BEGIN
SELECT home_id.NEXTVAL INTO :new.id FROM dual;
END;
--ԭʼ����
insert into home(num,type,status,prices,discount) values('301-1','���Է�',0,888,1);
insert into home(num,type,status,prices,discount) values('301-4','�齫��',0,666,1);

--����ΨһԼ��
alter table home
add constraint homenum_unique unique(num);
--����ɿ�Լ��
alter table home modify num not null;
