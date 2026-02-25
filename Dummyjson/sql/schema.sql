drop table if exists cart_items cascade;
drop table if exists carts cascade;
drop table if exists addresses cascade;
drop table if exists companies cascade;
drop table if exists products cascade;
drop table if exists users cascade;

create table users (
    id serial primary key,
    first_name text not null,
    last_name text not null,
    age int,
    gender text,
    email text not null unique,
    phone text,
    username text not null unique,
    birth_date date
);

create table addresses (
    id serial primary key,
    user_id int not null,
    address text,
    city text,
    state text,
    postal_code text,
    country text,
    foreign key (user_id) references users(id) on delete cascade
);

create table products (
    id serial primary key,
    title text not null,
    price numeric(10,2) not null,
    category text,
    brand text
);

create table carts (
    id serial primary key,
    user_id int not null,
    total numeric(12,2) not null,
    discounted_total numeric(12,2),
    total_products int,
    total_quantity int,
    foreign key (user_id) references users(id) on delete cascade
);

create table cart_items (
    id serial primary key,
    cart_id int not null,
    product_id int not null,
    title text not null,
    price numeric(10,2) not null,
    quantity int not null,
    total numeric(12,2),
    discount_percentage numeric(5,2),
    discounted_total numeric(12,2),
    foreign key (cart_id) references carts(id) on delete cascade,
    foreign key (product_id) references products(id)
);

create index if not exists idx_addresses_user_id on addresses(user_id);
create index if not exists idx_carts_user_id on carts(user_id);
create index if not exists idx_cart_items_cart_id on cart_items(cart_id);
create index if not exists idx_cart_items_product_id on cart_items(product_id);
