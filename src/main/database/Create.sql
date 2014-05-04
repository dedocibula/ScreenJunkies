--<ScriptOptions statementTerminator=";"/>
create table userinfo 	
(uid int primary key,	
age int,	
gender char,	
first_name varchar,	
last_name varchar,	
location varchar);	

insert into userinfo	
select distinct uid,age,gender,first_name,last_name,location from users;

create table performer	
(pid int primary key,	
first_name varchar,	
last_name varchar,	
age int,	
gender char);

insert into performer	
select distinct pid,first_name,last_name,age,gender from act;	

create table director	
(did int primary key,	
first_name varchar,	
last_name varchar,	
age int);	

insert into director	
select distinct did,first_name,last_name,age from videosdirect;

create table certificates	
(certification_name varchar primary key,	
content varchar);

insert into certificates	
select distinct certification_name, content from certify;

create table genre	
(genre varchar primary key);

insert into genre	
select distinct genre from video;	

create table videoinfo	
(vid int primary key,	
title varchar,	
release_year int,	
producer varchar,	
color varchar,	
country varchar,	
certification_name varchar references certificates(certification_name));

insert into videoinfo	
select distinct v.vid,title,release_year,producer,color,certification_name 
from video as v, certify as c where v.vid = c.vid;	


create table movieinfo	
(mid int primary key,	
mtitle varchar	
);	
	
insert into movieinfo	
select distinct vid, title from video where "type" = 'movie'

create table ratings	
(vid int references videoinfo(vid),	
uid int references userinfo(uid),	
rate_score int,	
ratingtime time,	
primary key(vid,uid, ratingtime));

insert into ratings	
select distinct vid, uid, rate_score, rate_time from users where vid is not 
null;

create table friendrequests	
(uid1 int references userinfo(uid),	
uid2 int references userinfo(uid),	
requesttime time,	
response varchar,	
responsetime time,	
primary key(uid1, uid2, requesttime),
check (uid1 <> uid2));

insert into friendrequests	
select user1, user2, request_time, response, response_time from 
friends_request;

create table friends	
(uid1 int references userinfo(uid),	
uid2 int references userinfo(uid),	
primary key(uid1, uid2));	

insert into friends	
(select uid1,uid2 from friendrequests where response = 'Y') union distinct (select uid2,uid1 from friendrequests where response = 'Y');

create table tvepisodeinfo	
(tvid int primary key references videoinfo(vid),	
episodeNum int);	

insert into tvepisodeinfo	
select distinct tvid, episodenum from tvepisode;	

create table collection	
(collection_id int primary key references videoinfo(vid),	
collection_name varchar);	

insert into collection	
select distinct collectionid, collection_title from incollection;

create table season	
(seasontitle varchar,	
seasonNum int,	
primary key(seasontitle, seasonNum));

insert into season	
select distinct seasontitle,seasonnumber from tvepisode;

create table in_collection(	
collectionid int references collection(collection_id),	
seasontitle varchar,	
seasonnum int,	
primary key (collectionid, seasontitle, seasonNum),	
foreign key (seasontitle, seasonnum) references season(seasontitle, seasonnum));

	
insert into in_collection	
select collectionid, seasontitle, seasonnumber from incollection;	


create table moviedirectors	
(did int references director(did),	
vid int references videoinfo(vid),	
primary key(did, vid));

insert into moviedirectors	
select distinct did, v.vid from videosdirect as vd, video as v where v.vid = 
vd.vid and type = 'movie';

create table tvepisodedirectors	
(did int references director(did),	
tvid int references tvepisodeinfo(tvid),	
primary key(did, tvid));

insert into moviedirectors	
select distinct did, v.vid from videosdirect as vd, video as v where v.vid = 
vd.vid and type = 'tvepisode';


create table belongtoGenre	
(vid int references videoinfo (vid),	
genre varchar references genre (genre), 	
primary key (vid, genre));

insert into belongtoGenre	
select distinct vid, genre from video;

create table inseason	
(tvid int references tvepisodeinfo (tvid),	
seasontitle varchar,	
seasonNum int,	
foreign key (seasontitle, seasonNum) references season(seasontitle, 
seasonNum),	
primary key (tvid, seasontitle, seasonNum));

insert into inseason	
select tvid, seasontitle, seasonnumber from tvepisode; 	


create table actin	
(vid int references videoinfo(vid),	
pid int references performer(pid),	
primary key(vid, pid));

insert into actin	
select distinct vid, pid from act;