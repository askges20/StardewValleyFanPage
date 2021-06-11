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
insert into posting values(1,'거대 호박이 자랐어요!', '스타듀밸리 3년차 가을에 드디어 거대 호박이 자랐어요 기념으로 사진 한장~', 'askges20', '2020년 12월 05일 토요일 오후 4:32', 'big_pumpkin.png');
insert into posting values(2,'겨울 축제 야시장에 처음 와봤어요', '겨울에는 바닷가에서 야시장이 열리네요!! 무료로 커피도 받고 상점 구경도 하고 심해 낚시도 했어용ㅎㅎ 다음 이벤트가 기대돼요', 'askges20', '2020년 12월 05일 토요일 오후 6:32', 'night_market.png');

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

insert into npc values('헤일리', 'Haley', '여', '봄 14일', '언니인 에밀리와 함께 사는 헤일리는 고등학교 시절에 퀸카로 지냈다고 한다. 처음에는 자기중심적이라 주인공을 무시하는 일이 많지만, 친밀도가 올라 마음을 열수록 시골 생활도 재밌다면서 순수한 모습을 되찾는다.');
insert into npc values('레아', 'Leah', '여', '겨울 23일', '예술가인 레아는 마니의 집 밑의 오두막에 산다. 외지인이지만 어린 시절에 스타듀 밸리에 휴가 차 머물렀던 적이 있었으며 최근에 스타듀 밸리로 이사 왔다고 한다.');
insert into npc values('마루', 'Maru', '여', '여름 10일', '세바스찬의 이부 여동생으로, 공학과 천문학에 관심이 있어 발명품에 전념하거나, 아버지의 연구를 도와주기도 한다.');
insert into npc values('페니', 'Penny', '여', '가을 2일', '강 근처에 있는 작은 트레일러에 어머니 팸과 함께 살고 있다. 페니는 수줍음 많고 얌전한 성격이며 요리와 지역 도서관에서 책읽기를 좋아한다.');
insert into npc values('애비게일', 'Abigail', '여', '가을 13일', '잡화점 주인인 피에르의 딸인 애비게일은 특이한 취향 때문에 부모와 자주 다툰다. 방에서 게임을 하거나, 묘지에서 홀로 있거나, 광산 근처 호숫가에서 플루트를 연주하는 걸 볼 수 있다.');
insert into npc values('에밀리', 'Emily', '여', '봄 27일', '헤일리의 언니로, 주점에서 거스의 일을 돕는다. 매우 명랑하고 좋은 성격에, 모험소녀 애비게일조차 능가하는 극강의 4차원 캐릭터로, 동생인 헤일리로부터 괴짜 취급을 받기도 한다.');

insert into npc values('알렉스', 'Alex', '남', '여름 13일', '운동선수가 되는 것이 꿈인 활기찬 청년. 조부모인 에블린과 조지의 집에 같이 살고 있으며 운동을 좋아한다.');
insert into npc values('엘리엇', 'Elliott', '남', '가을 5일', '바닷가의 오두막에 혼자 살면서 새로운 소설을 구상하는 소설가이다.');
insert into npc values('하비', 'Harvey', '남', '겨울 14일', '펠리컨 마을의 유일한 의사이다. 원래는 조종사가 꿈이었으나 근시와 고소공포증 때문에 의사로 진로를 바꿨다고 한다.');
insert into npc values('샘', 'Sam', '남', '여름 17일', '놀기를 좋아하는 외향적인 성격을 가진 캐릭터이다. 기타 연주, 스케이트 보드를 연습, 휴대용 게임기를 가지고 노는 것이 취미이다.');
insert into npc values('세바스찬', 'Sebastian', '남', '겨울 10일', '어머니 로빈의 목공소 지하에 있는 방에서 살고 있는 프로그래머이다. 야외 활동이나 대인 관계를 좋아하지 않고 대부분의 시간을 집에서 보낸다.');
insert into npc values('셰인', 'Shane', '남', '봄 20일', '마니의 조카로 마니의 농장에서 살고 있다. 조자마트에서 일을 하고 있으며 일이 끝나면 주점에서 술을 마시는 모습을 자주 볼 수 있다.');


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
