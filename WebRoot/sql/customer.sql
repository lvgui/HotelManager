--�����
create table customer(
id  number(8) primary key,
name varchar2(20) not null,
credentialstype varchar2(255) not null,
credentialsnum varchar2(255) not null unique
)
--���� + ������
--����
create  sequence customer_id 
increment by 1
start with 1
nomaxvalue
nocycle
--������
CREATE OR REPLACE TRIGGER customer_before_insert
BEFORE INSERT ON customer
FOR EACH ROW
BEGIN
SELECT customer_id.NEXTVAL INTO :new.id FROM dual;
END;
--ԭʼ����
insert into customer(name,credentialstype,credentialsnum) values('��ϣ','��ݿ�','03121032135');
insert into customer(name,credentialstype,credentialsnum) values('Ů��','��ݿ�','1385135115');



