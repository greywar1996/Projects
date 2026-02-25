#1 - Users and their carts

select u.id as user_id,
u.first_name,
u.last_name,
c.id as cart_id,
c.total
from users u
left join carts c 
on u.id = c.user_id
order by u.id

#2 - Detailing cart

select u.first_name,
u.last_name,
ci.title,
ci.quantity,
ci.price,
ci.total
from users u
inner join carts c 
on u.id = c.user_id
inner join cart_items ci
on c.id = ci.cart_id
order by u.id

#3 - Total purchases amount by users

select u.first_name,
u.last_name,
sum(ci.total) as total_spent
from users u
inner join carts c
on u.id = c.user_id
inner join cart_items ci
on c.id = ci.cart_id
group by u.id
order by total_spent desc

#4 - Best selling product

select title,
sum(quantity) as total_sold
from cart_items
group by title
order by total_sold desc