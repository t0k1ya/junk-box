select * from articles as a \
inner join users as u on u.id = a.user_id \
inner join article_category_relations as ac on a.id = ac.article_id \
inner join categories as c on ac.category_id = c.id;

select title, c.name from articles as a \
inner join users as u on u.id = a.user_id \
inner join article_category_relations as ac on a.id = ac.article_id \
inner join categories as c on ac.category_id = c.id;