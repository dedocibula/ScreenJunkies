--<ScriptOptions statementTerminator=";"/>
create table userinfo 	
(uid int primary key,	
age int,	
gender char,	
first_name varchar,	
last_name varchar,	
location varchar);	

create table performer	
(pid int primary key,	
first_name varchar,	
last_name varchar,	
age int,	
gender char);

create table director	
(did int primary key,	
first_name varchar,	
last_name varchar,	
age int);	

create table certificates	
(certification_name varchar primary key,	
content varchar);

create table genre	
(genre varchar primary key);

create table videoinfo	
(vid int primary key,	
title varchar,	
release_year int,	
producer varchar,	
color varchar,	
country varchar,	
certification_name varchar references certificates(certification_name));

create table movieinfo	
(mid int primary key,	
mtitle varchar	
);	

create table ratings	
(vid int references videoinfo(vid),	
uid int references userinfo(uid),	
rate_score int,	
ratingtime time,	
primary key(vid,uid, ratingtime));

create table friendrequests	
(uid1 int references userinfo(uid),	
uid2 int references userinfo(uid),	
requesttime time,	
response varchar,	
responsetime time,	
primary key(uid1, uid2, requesttime),
check (uid1 <> uid2));

create table friends	
(uid1 int references userinfo(uid),	
uid2 int references userinfo(uid),	
primary key(uid1, uid2));	

create table tvepisodeinfo	
(tvid int primary key references videoinfo(vid),	
episodeNum int);	

	
create table collection	
(collection_id int primary key references videoinfo(vid),	
collection_name varchar);	

create table season	
(seasontitle varchar,	
seasonNum int,	
primary key(seasontitle, seasonNum));

create table in_collection(	
collectionid int references collection(collection_id),	
seasontitle varchar,	
seasonnum int,	
primary key (collectionid, seasontitle, seasonNum),	
foreign key (seasontitle, seasonnum) references season(seasontitle, seasonnum));

create table moviedirectors	
(did int references director(did),	
vid int references videoinfo(vid),	
primary key(did, vid));

create table tvepisodedirectors	
(did int references director(did),	
tvid int references tvepisodeinfo(tvid),	
primary key(did, tvid));

create table belongtoGenre	
(vid int references videoinfo (vid),	
genre varchar references genre (genre), 	
primary key (vid, genre));	

create table inseason	
(tvid int references tvepisodeinfo (tvid),	
seasontitle varchar,	
seasonNum int,	
foreign key (seasontitle, seasonNum) references season(seasontitle, 
seasonNum),	
primary key (tvid, seasontitle, seasonNum));

alter table actin	
(vid int references videoinfo(vid),	
pid int references performer(pid),	
primary key(vid, pid));