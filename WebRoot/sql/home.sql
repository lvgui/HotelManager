--房间表
create table home(
id  number(8) primary key,
num varchar2(20),
type varchar2(20),
status number(2),
prices number(8,2),
discount number(3,2),
images varchar2(255) default 'fang.jpg'
)
--序列 + 触发器
--序列
create  sequence home_id 
increment by 1
start with 1
nomaxvalue
nocycle
--触发器
CREATE OR REPLACE TRIGGER home_before_insert
BEFORE INSERT ON home
FOR EACH ROW
BEGIN
SELECT home_id.NEXTVAL INTO :new.id FROM dual;
END;
--原始数据
insert into home(num,type,status,prices,discount) values('301-1','电脑房',0,888,1);
insert into home(num,type,status,prices,discount) values('301-4','麻将房',0,666,1);

--房间唯一约束
alter table home
add constraint homenum_unique unique(num);
--房间飞空约束
alter table home modify num not null;
