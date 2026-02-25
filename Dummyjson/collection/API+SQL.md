## Scenario API+SQL

# Scenario 1: Filter validation
**API:** 
GET /products/category/smartphones
**SQL:**
SELECT COUNT(*)
from Products
where category = 'smartphones'

**What was tested:**
Проверка корректности фильтрации товаров по категории
**Steps performed:**
1. Выполнен API-запрос на получение товаров категории smartphones.
2. Подсчитано кол-во объектов в ответе.
3. Выполнен SQL-запрос с COUNT по той же категории (smartphones).
4. Сравнены результаты.
**Validation logic:**
Сравнить кол-во товаров в API-ответе с результатом SQL COUNT
**Expected result:**
Количество товаров в API должно полностью совпадать с результатом SQL-запроса

# Scenario 2: Unique brands validation
**API:**
GET /categories
**SQL:**
SELECT Distinct category
from products
order by category

**What was tested:**
Проверка уникальности и корректности списка брендов
**Steps performed:**
1. Выполнен API-запрос на получение всех товаров.
2. Из ответа извлечен список брендов.
3. Удалены дубликаты брендов из APi.
4. Выполнен SQL-запрос с DISTINCT.
5. Сравнены списки.
**Validation logic:**
Сравнить список уникальных брендов из API с результатом SQL DISTINCT
**Expected result:**
Список брендов должен совпадать, без лишних или отсутствующих значений

# Scenario 3: Distribution validation
**API:**
GET /products
**SQL:**
Select category, count(*) as total_products
from products
group by category
order by total_products desc

**What was tested:**
Проверка распределения товаров по категориям
**Steps performed:**
1. Выполнен API-запрос на получение списка всех товаров.
2. Выполнена ручная группировка товаров по category.
3. Подсчитано количество товаров в каждой категории.
4. Выполнен SQL-запрос с GROUP BY.
5. Сравнены результаты.
**Validation logic:**
Сравнить кол-во товаров в каждой категории между API и SQL
**Expected result:**
Количество товаров по каждой категории должно совпадать

# Scenario 4: Cart integrity validation
**API:**
GET /carts/1
**SQL:**
Select c.id as cart_id, u.username, ci.product_id, ci.title, ci.price, ci.quantity
from carts c
inner join users u
on c.user_id = u.id
inner join cart_items ci
on.cart_id = c.id
where c.id = 1

**What was tested:**
Проверка корректности связей между корзиной, пользователем и товарами
**Steps performed:**
1. Получена корзина через API.
2. Проверен user_id корзины.
3. Проверены товары в корзине.
4. Выполнен SQL-запрос с JOIN.
5. Сравнены результаты.
**Validation logic:**
Проверить соответствие пользователя и списка товаров в API данным, полученными через JOIN
**Expected result:**
- Пользователь должен совпадать
- Список товаров должен совпадать
- Кол-во товаров должны совпадать

# Scenario 5: Sorting validation
**API:**
GET /products?sort=price&order=desc
**SQL:**
select id, title, price
from products
order by price desc

**What was tested:**
Проверка корректности сортировки по цене
**Steps performed:**
1. Выполнен API-запрос с параметрами сортировки.
2. Проверен порядок цен в ответе.
3. Выполнен SQL-запрос с ORDER BY.
4. Сравнен порядок.
**Validation logic:**
Проверить, что товаы в API отсортированы по убыванию цены.
**Expected result:**
Порядок товаров в API должен полностью соответствовать SQL ORDER BY DESC

# Scenrio 6: SUM calculation validation
**API:**
GET /carts/1
**SQL:**
Select sum(price * quantity) as total_calculated
from cart_items
where cart_id = 1

**What was tested:**
Проверка корректности расчета общей стоимости корзины
**Steps performed:**
1. Получена корзина через API.
2. Рассчитана сумма (price * quantity) вручную.
3. Выполнен SQL-запрос с SUM.
4. Сравнены результаты.
**Validation logic:**
Сравнить рассчитанную сумму с SQL результатом
**Expected result:**
Итоговая сумма должна совпадать

# Scenario 7: Missing address validation
**API:**
GET /users/{id}
**SQL:**
select u.id, u.username, a.id as address_id
from users u
left join addresses a
on u.id = a.user_id
where a.id is null

**What was tested:**
Проверка наличия пользователей без адресов
**Steps performed:**
1. Выполнен SQL LEFT JOIN для поиска пользователей без адреса.
2. Получен список таких пользователей.
3. Проверены соответствующие пользователи через API.
**Validation logic:**
Если у пользователя отсутствует адрес в БД, API не должен возвращать фиктивные данные адреса
**Expected result:**
- Пользователи без адреса не должны иметь address в API
- API не должен возвращать некорректные данные

# Scenario 8: Non-existing product
**API:**
GET /products/7777
**SQL:**
select *
from products
where id = 7777

**What was tested:**
Проверка обработки запроса к несуществующему ресурсу
**Steps performed:**
1. Выполнен API-запрос с несуществующим ID
2. Выполнен SQL-запрос.
3. Сравнены результаты.
**Validation logic:**
Если запись отсутствует в БД, API должен корректно обработать запрос
**Expected result:**
- SQL возвращает 0 строк
- API возвращает 404 или корректный путой ответ.
- Отсутствует 500 ошибка