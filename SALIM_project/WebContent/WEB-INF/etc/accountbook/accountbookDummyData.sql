drop sequence seq_dummy_n;

drop sequence seq_dummy_nn;

drop sequence seq_dummy_e ; 

--더미 데이터에 사용할 sequence 메모
create sequence seq_dummy_nn ; -- no값에 들어감
create sequence seq_dummy_n increment BY 3 ; --  공통 ->날짜

--10월
insert into notes values(seq_dummy_nn.nextval,'2016-10,'||seq_dummy_n.nextval,'운수 좋은 날이 되자~~','test');
insert into notes values(seq_dummy_nn.nextval,'2016-10,'||seq_dummy_n.nextval,'오늘 따라 날씨가 구슬프구나~~','test');
insert into notes values(seq_dummy_nn.nextval,'2016-10,'||seq_dummy_n.nextval,'비가 오는 날에는 파전이라던데~~','test');
insert into notes values(seq_dummy_nn.nextval,'2016-10,'||seq_dummy_n.nextval,'음~~','test');
insert into notes values(seq_dummy_nn.nextval,'2016-10,'||seq_dummy_n.nextval,'오늘 하루도 힘차게 !','test');
insert into notes values(seq_dummy_nn.nextval,'2016-10,'||seq_dummy_n.nextval,'그래 가보자~~','test');
insert into notes values(seq_dummy_nn.nextval,'2016-10,'||seq_dummy_n.nextval,'으 어제는 너무 갔다.~~','test');
insert into notes values(seq_dummy_nn.nextval,'2016-10,'||seq_dummy_n.nextval,'이! 이! 이!','test');
insert into notes values(seq_dummy_nn.nextval,'2016-10,'||seq_dummy_n.nextval,'오늘은 1000원의 행복을 가져보자!','test');
insert into notes values(seq_dummy_nn.nextval,'2016-10,'||seq_dummy_n.nextval,'세월이 흘러가는 구나 나도 이제 늙었구나~','test');

drop sequence seq_dummy_n;
create sequence seq_dummy_n increment BY 3 ; -- 날짜
--11월
insert into notes values(seq_dummy_nn.nextval,'2016-11,'||seq_dummy_n.nextval,'티끌 모아 태산','test');
insert into notes values(seq_dummy_nn.nextval,'2016-11,'||seq_dummy_n.nextval,'10원이 10개면 100원','test');
insert into notes values(seq_dummy_nn.nextval,'2016-11,'||seq_dummy_n.nextval,'100원이 10개면 1000원','test');
insert into notes values(seq_dummy_nn.nextval,'2016-11,'||seq_dummy_n.nextval,'1000원이 10개면 10000원','test');
insert into notes values(seq_dummy_nn.nextval,'2016-11,'||seq_dummy_n.nextval,'10000원이 10개면 100000원','test');
insert into notes values(seq_dummy_nn.nextval,'2016-11,'||seq_dummy_n.nextval,'100000원이 10개면 1,000,000원','test');
insert into notes values(seq_dummy_nn.nextval,'2016-11,'||seq_dummy_n.nextval,'1,000,000원이 10개면 10,000,000원','test');
insert into notes values(seq_dummy_nn.nextval,'2016-11,'||seq_dummy_n.nextval,'10,000,000원이 10개면 100,000,000원','test');
insert into notes values(seq_dummy_nn.nextval,'2016-11,'||seq_dummy_n.nextval,'후~ 오늘은 절대 술에 돈을 쓰지 않겠어','test');
insert into notes values(seq_dummy_nn.nextval,'2016-11,'||seq_dummy_n.nextval,'SALIM가계부','test');


drop sequence seq_dummy_n;
create sequence seq_dummy_n increment BY 3 ; -- 날짜
--12월
insert into notes values(seq_dummy_nn.nextval,'2016-12,'||seq_dummy_n.nextval,'가난은 인격의 스승이다.','test');
insert into notes values(seq_dummy_nn.nextval,'2016-12,'||seq_dummy_n.nextval,'돈에 봉사하는 자는 스스로의 노예의 노예이다.','test');
insert into notes values(seq_dummy_nn.nextval,'2016-12,'||seq_dummy_n.nextval,'돈이 인간을 지배하고 인간은 돈을 숭배한다.','test');
insert into notes values(seq_dummy_nn.nextval,'2016-12,'||seq_dummy_n.nextval,'가벼운 주머니는 마음을 무겁게 한다.','test');
insert into notes values(seq_dummy_nn.nextval,'2016-12,'||seq_dummy_n.nextval,'재산이 많은 사람이 그 재산을 자랑하고 있더라도, 그 돈을 어떻게 쓰는지 알 수 있을 때까지는 그를 칭찬하지 말라.-소크라테스-','test');
insert into notes values(seq_dummy_nn.nextval,'2016-12,'||seq_dummy_n.nextval,'돈은 최선의 종이요, 최악의 주인이다.-프랜시스 베이컨-','test');
insert into notes values(seq_dummy_nn.nextval,'2016-12,'||seq_dummy_n.nextval,'가난은 사람을 현명하게도 처절하게도 만든다.-베르톨트 브레히트-','test');
insert into notes values(seq_dummy_nn.nextval,'2016-12,'||seq_dummy_n.nextval,'만족할 줄 아는 사람은 진정한 부자이고, 탐욕스러운 사람은 진실로 가난한 사람이다.-솔론-','test');
insert into notes values(seq_dummy_nn.nextval,'2016-12,'||seq_dummy_n.nextval,'정당한 소유는 인간을 자유롭게 하지만 지나친 소유는 소유자체가 주인이 되어 소유자를 노예로 만든다.-니체-','test');
insert into notes values(seq_dummy_nn.nextval,'2016-12,'||seq_dummy_n.nextval,'성공해서 만족하는 것은 아니다. 만족하고 있었기 때문에 성공한 것이다. -알랭-','test');


--더미 데이터에 사용할 sequence 지출
create sequence seq_dummy_e ; 

drop sequence seq_dummy_n;
create sequence seq_dummy_n increment BY 3 ; -- 날짜

--10월
insert into expense values(seq_dummy_e.nextval,'test',19,'2016-10,'||seq_dummy_n.nextval,'아침식사',5000,0,'미등록');
insert into expense values(seq_dummy_e.nextval,'test',19,'2016-10,'||seq_dummy_n.nextval,'점심식사',6000,0,'미등록');
insert into expense values(seq_dummy_e.nextval,'test',19,'2016-10,'||seq_dummy_n.nextval,'저녁',7000,0,'미등록');
insert into expense values(seq_dummy_e.nextval,'test',19,'2016-10,'||seq_dummy_n.nextval,'아침식사',5000,0,'미등록');
insert into expense values(seq_dummy_e.nextval,'test',19,'2016-10,'||seq_dummy_n.nextval,'아침식사',5000,0,'미등록');
insert into expense values(seq_dummy_e.nextval,'test',19,'2016-10,'||seq_dummy_n.nextval,'아침식사',5000,0,'미등록');
insert into expense values(seq_dummy_e.nextval,'test',19,'2016-10,'||seq_dummy_n.nextval,'아침식사',5000,0,'미등록');
insert into expense values(seq_dummy_e.nextval,'test',19,'2016-10,'||seq_dummy_n.nextval,'아침식사',5000,0,'미등록');
insert into expense values(seq_dummy_e.nextval,'test',19,'2016-10,'||seq_dummy_n.nextval,'아침식사',5000,0,'미등록');
insert into expense values(seq_dummy_e.nextval,'test',19,'2016-10,'||seq_dummy_n.nextval,'아침식사',5000,0,'미등록');













