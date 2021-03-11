-- 1. Брой на потребители.

select count(username) from users

-- 2. Най-стария потребител

select * from users order by birthDate asc limit 1

-- 3. Най-младия потребител.

select * from users order by birthDate desc limit 1

-- 4. Колко юзъра са регистрирани с мейли от abv и колко от gmail и колко с различни от
-- двата

select count(*) FROM users where email like '%abv.bg%' 

select count(*) FROM users where email like '%gmail.com%' 

select count(*) from users where not email like ('%abv%' and '%gmail.com%')

-- 5. Кои юзъри са banned.

select * from users where 'isBanned' = 0

-- 6. Изкарайте всички потребители от базата като ги наредите по име в азбучен ред и
-- дата на раждане(от най-младия към най-възрастния).

select * from users order by username, birthdate asc  

-- 7. Изкарайте всички потребители от базата, на които потребителското име започва с a.

select * from users where username like 'a%'

-- 8. Изкарайте всички потребители от базата, които съдържат а username името си.

select * from users where username like '%a%'

-- 9. Изкарайте всички потребители от базата, чието име се състои от 2 имена.

select * from users where username like '__% __%'

-- 10. Регистрирайте 1 юзър през UI-а и го забранете след това от базата.

select * from users where username ='jgtjgtjgt1' 

update users set isBanned = '1' where username = 'jgtjgtjgt1'

-- 11. Брой на всички постове.

select count(createdAt) from posts

-- 12. Брой на всички постове групирани по статуса на post-a.

select count(postStatus) from posts 
select count(postStatus) from posts where poststatus ='private' 
select count(postStatus) from posts where poststatus ='public' 

-- 13. Намерете поста/овете с най-къс caption.

select * from posts order by caption asc 


select * from posts order by caption desc 




 




-- 1. Брой на потребители.
select count(username) from users

-- 2. Най-стария потребител
select * from users order by birthDate asc limit 1

-- 3. Най-младия потребител.
select * from users order by birthDate desc limit 1

-- 4. Колко юзъра са регистрирани с мейли от abv и колко от gmail и колко с различни от двата
select count(*) FROM users where email like '%abv.bg%' 

select count(*) FROM users where email like '%gmail.com%' 

select count(*) from users where not email like ('%abv%' and '%gmail.com%')

-- 5. Кои юзъри са banned.
select * from users where 'isBanned' = 0

-- 6. Изкарайте всички потребители от базата като ги наредите по име в азбучен ред и дата на раждане(от най-младия към най-възрастния).
select * from users order by username, birthdate asc  

-- 7. Изкарайте всички потребители от базата, на които потребителското име започва с a.
select * from users where username like 'a%'

-- 8. Изкарайте всички потребители от базата, които съдържат а username името си.
select * from users where username like '%a%'

-- 9. Изкарайте всички потребители от базата, чието име се състои от 2 имена.
select * from users where username like '__% __%'

-- 10. Регистрирайте 1 юзър през UI-а и го забранете след това от базата.
update users set isBanned = '1' where username = 'jgtjgtjgt1'

-- 11. Брой на всички постове.
select count(createdAt) from posts

-- 12. Брой на всички постове групирани по статуса на post-a.
select count(postStatus) from posts 
select count(postStatus) from posts where poststatus ='private' 
select count(postStatus) from posts where poststatus ='public' 

-- 13. Намерете поста/овете с най-къс caption.
select * from posts order by caption asc limit 1

-- 14. Покажете поста с най-дълъг caption.
select * from posts order by caption desc limit 1

-- 15. Кой потребител има най-много постове. Използвайте join заявка.
select p.id, p.userID, u.id, u.username
from posts p
join users u
on p.userID = u.ID 
where p.id order by u.username asc limit 1

-- 16. Кои потребители имат най-малко постове. Използвайте join заявка.
select p.id, p.userID, u.id, u.username
from posts p
join users u
on p.userID = u.ID 
where p.id order by u.username desc limit 1

-- 19. Кои са постовете с най-много коментари. Използвайте вложена заявка и where 

select * from posts order by commentsCount desc

-- 20. Покажете най-стария пост. Може да използвате order или с aggregate function.

select * from posts order by createdAt asc limit 1

-- 21. Покажете най-новия пост. Може с order или с aggregate function.
select * from posts order by createdAt desc limit 1


-- 22. Покажете всички постове с празен caption.

select * from posts where caption 

-- 23. Създайте потребител през UI-а, добавете му public пост през базата и проверете дали се е създал през UI-а.  -- откраднах пост на user c ID 11


UPDATE posts
SET userID = '633'
WHERE id = '11'

-- 25. Покажете само постове с коментари и самите коментари.

select p.userID, p.userID, p.caption, c.content, c.userID
from posts p
join comments c
on p.userID = c.userID 
where content is not null

-- 28. Кои потребители са like-нали най-много постове.

select p.userID, p.ID, p.caption, u.usersID, u.postsID
from posts p
join users_liked_posts u
on p.userID = u.usersID 
where p.userID order by u.postsID desc
