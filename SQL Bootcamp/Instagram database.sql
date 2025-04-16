create table users (
id int identity(1,1) primary key,
username varchar(255) unique not null,
created_at datetime default getdate() --  now() w mysql, timestmap też w mysql -Techniczny binarny typ do śledzenia zmian w wierszach (alias rowversion) – nie data/czas!
)

insert into users (username) values
('BlueTheCat'),('Charlie'),('Colte')



create table photos (
id int identity(1,1) primary key,
user_id int not null,
image_url varchar(255) not null,
created_at datetime default getdate(),
constraint fk_user_id_photos foreign key (user_id) references users(id)
)
alter table photos
add constraint unique_url unique(image_url)

insert into photos (image_url, user_id) values 
('/dasda',1), ('/ddfgfgda',1), ('/ghbf4566',1)

select *, username from photos
join users on photos.user_id=users.id


create table comments (
id int identity(1,1) primary key,
user_id int not null,
photo_id int not null,
text_message varchar(255) not null, 
created_at datetime default getdate(),
foreign key (user_id) references users(id),
foreign key (photo_id) references photos(id)
)

sp_help comments

create table likes (
--id int identity(1,1) primary key, nie potrzebujemy, bo w gdy user likeuje kilka razy to wciaz bedzie naliczalo kolejne like'i
-- likei nie przechowuja zadnej innej informacji wiec w innych tabelach nie bedziemy sie odwolywac do tej tabeli przez klucze or sth
user_id int not null,
photo_id int not null,
created_at datetime default getdate(),
constraint likes_user_id foreign key (user_id) references users(id),
constraint likes_photo_id foreign key (photo_id) references photos(id),
primary key(user_id, photo_id) -- musi byc unikalna kombinacja, unikamy dublowania likeow
)

create table tags (
id int identity(1,1) primary key,
tag_name varchar(255) unique,
created_at datetime default getdate()
)

create table photo_tags (
tag_id int not null,
photo_id int not null,
foreign key(tag_id) references tags(id),
foreign key (photo_id) references photos(id),
primary key(tag_id, photo_id) --nie powstanie kolumna id

sp_help photo_tags

create table follows (
follower_id int not null,-- person who gave followe 
followee_id int not null,-- person who got 
created_at datetime default getdate(),
foreign key (follower_id) references users(id),
foreign key (followee_id) references users(id),
primary key(follower_id, followee_id)
)


