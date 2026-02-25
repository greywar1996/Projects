insert into users 
(first_name, last_name, age, gender, email, phone, username, birth_date)
values
('Ivan', 'Petrov', 25, 'male', 'ivan@mail.com', '111-111', 'ivan25', '1999-05-10'),
('Anna', 'Smirnova', 30, 'female', 'anna@mail.com', '222-222', 'anna30', '1994-03-15'),
('Sergey', 'Ivanov', 28, 'male', 'sergey@mail.com', '333-333', 'sergey28', '1996-07-20');

insert into products 
(title, price, category, brand)
values
('iPhone 15', 999.99, 'smartphones', 'Apple'),
('Galaxy S24', 899.99, 'smartphones', 'Samsung'),
('MacBook Air M3', 1499.00, 'laptops', 'Apple'),
('AirPods Pro', 249.50, 'audio', 'Apple'),
('PlayStation 5', 599.00, 'gaming', 'Sony');

insert into addresses
(user_id, address, city, state, postal_code, country)
values
(1, 'Lenina 10', 'Moscow', 'Moscow region', '101000', 'Russia'),
(2, 'Nevsky 25', 'Saint Petersburg', 'SPB region', '190000', 'Russia'),
(3, 'Baumana 5', 'Kazan', 'Tatarstan', '420000', 'Russia');

insert into carts
(user_id, total, discounted_total, total_products, total_quantity)
values
(1, 1499.49, 1499.49, 2, 3),
(2, 1499.00, 1499.00, 1, 1),
(3, 2396.97, 2200.00, 2, 4);

insert into cart_items
(cart_id, product_id, title, price, quantity, total, discount_percentage, discounted_total)
values
(1, 1, 'iPhone 15', 999.99, 1, 999.99, 0, 999.99),
(1, 4, 'AirPods Pro', 249.50, 2, 499.00, 0, 499.00),
(2, 3, 'MacBook Air M3', 1499.00, 1, 1499.00, 0, 1499.00),
(3, 5, 'PlayStation 5', 599.00, 1, 599.00, 0, 599.00),
(3, 2, 'Galaxy S24', 899.99, 3, 2699.97, 10, 2429.97);

