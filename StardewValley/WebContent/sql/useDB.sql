create table user(
	id varchar(50) not null,
	password varchar(50) not null,
	nickname varchar(200) not null,
	primary key (id)
);

desc user;
select * from user;

create table posting(
	num int not null auto_increment,
	title text not null,
	content text not null,
	id varchar(50) not null,
	date text not null,
	image text null,
	primary key (num)
);

desc posting;
select * from posting;
drop table posting;
insert into posting values(1,'�Ŵ� ȣ���� �ڶ����!', '��Ÿ��븮 3���� ������ ���� �Ŵ� ȣ���� �ڶ���� ������� ���� ����~', 'askges20', '2020�� 12�� 05�� ����� ���� 4:32', 'big_pumpkin.png');
insert into posting values(2,'�ܿ� ���� �߽��忡 ó�� �ͺþ��', '�ܿ￡�� �ٴ尡���� �߽����� �����׿�!! ����� Ŀ�ǵ� �ް� ���� ���浵 �ϰ� ���� ���õ� �߾�뤾�� ���� �̺�Ʈ�� ���ſ�', 'askges20', '2020�� 12�� 05�� ����� ���� 6:32', 'night_market.png');

create table npc(
	name varchar(60) not null,
	en_name varchar(60) not null,
	gender varchar(30) not null,
	birthday varchar(60) not null,
	description text not null,
	primary key(name)
);
drop table npc;
desc npc;
select * from npc;

insert into npc values('���ϸ�', 'Haley', '��', '�� 14��', '����� ���и��� �Բ� ��� ���ϸ��� ����б� ������ ��ī�� ���´ٰ� �Ѵ�. ó������ �ڱ��߽����̶� ���ΰ��� �����ϴ� ���� ������, ģ�е��� �ö� ������ ������ �ð� ��Ȱ�� ��մٸ鼭 ������ ����� ��ã�´�.');
insert into npc values('����', 'Leah', '��', '�ܿ� 23��', '�������� ���ƴ� ������ �� ���� ���θ��� ���. ������������ � ������ ��Ÿ�� �븮�� �ް� �� �ӹ����� ���� �־����� �ֱٿ� ��Ÿ�� �븮�� �̻� �Դٰ� �Ѵ�.');
insert into npc values('����', 'Maru', '��', '���� 10��', '���ٽ����� �̺� ����������, ���а� õ���п� ������ �־� �߸�ǰ�� �����ϰų�, �ƹ����� ������ �����ֱ⵵ �Ѵ�.');
insert into npc values('���', 'Penny', '��', '���� 2��', '�� ��ó�� �ִ� ���� Ʈ���Ϸ��� ��Ӵ� �԰� �Բ� ��� �ִ�. ��ϴ� ������ ���� ������ �����̸� �丮�� ���� ���������� å�б⸦ �����Ѵ�.');
insert into npc values('�ֺ����', 'Abigail', '��', '���� 13��', '��ȭ�� ������ �ǿ����� ���� �ֺ������ Ư���� ���� ������ �θ�� ���� ������. �濡�� ������ �ϰų�, �������� Ȧ�� �ְų�, ���� ��ó ȣ�������� �÷�Ʈ�� �����ϴ� �� �� �� �ִ�.');
insert into npc values('���и�', 'Emily', '��', '�� 27��', '���ϸ��� ��Ϸ�, �������� �Ž��� ���� ���´�. �ſ� ����ϰ� ���� ���ݿ�, ����ҳ� �ֺ�������� �ɰ��ϴ� �ذ��� 4���� ĳ���ͷ�, ������ ���ϸ��κ��� ��¥ ����� �ޱ⵵ �Ѵ�.');

insert into npc values('�˷���', 'Alex', '��', '���� 13��', '������� �Ǵ� ���� ���� Ȱ���� û��. ���θ��� ������ ������ ���� ���� ��� ������ ��� �����Ѵ�.');
insert into npc values('������', 'Elliott', '��', '���� 5��', '�ٴ尡�� ���θ��� ȥ�� ��鼭 ���ο� �Ҽ��� �����ϴ� �Ҽ����̴�.');
insert into npc values('�Ϻ�', 'Harvey', '��', '�ܿ� 14��', '�縮�� ������ ������ �ǻ��̴�. ������ �����簡 ���̾����� �ٽÿ� ��Ұ����� ������ �ǻ�� ���θ� �ٲ�ٰ� �Ѵ�.');
insert into npc values('��', 'Sam', '��', '���� 17��', '��⸦ �����ϴ� �������� ������ ���� ĳ�����̴�. ��Ÿ ����, ������Ʈ ���带 ����, �޴�� ���ӱ⸦ ������ ��� ���� ����̴�.');
insert into npc values('���ٽ���', 'Sebastian', '��', '�ܿ� 10��', '��Ӵ� �κ��� ����� ���Ͽ� �ִ� �濡�� ��� �ִ� ���α׷����̴�. �߿� Ȱ���̳� ���� ���踦 �������� �ʰ� ��κ��� �ð��� ������ ������.');
insert into npc values('����', 'Shane', '��', '�� 20��', '������ ��ī�� ������ ���忡�� ��� �ִ�. ���ڸ�Ʈ���� ���� �ϰ� ������ ���� ������ �������� ���� ���ô� ����� ���� �� �� �ִ�.');


create table comment(
	num int not null auto_increment,
	user_id varchar(50) not null,
	post_num int not null,
	content text not null,
	date text not null,
	primary key (num)
);
desc comment;
select * from comment;

create table review(
	num int not null auto_increment,
	user_id varchar(50) not null,
	content text not null,
	primary key(num)
);

select * from review;
delete from review where num=5;

create table Distribution(
	id int not null auto_increment,
	name varchar(20),
	number int,
	location varchar(20),
	primary key(id)
);
