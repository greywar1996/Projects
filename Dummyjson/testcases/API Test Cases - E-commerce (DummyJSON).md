## API Test Cases - E-commerce (DummyJSON)

# AUTH

### ID: TC-001
**Title:** Успешная авторизация с валидными данными
**Preconditions:** Пользователь существует в системе
**Steps to reproduce:**
1. Отправить POST /auth/login с корректными username и password
2. Проверить статус ответа
3. Проверить тело ответа
**Expected result:**
Статус код 200
В ответе присутствуют:
accessToken(string)
refreshToken(string)
id(number)
username(string)
**Priority:** Высокий

### ID: TC-002
**Title:** Авторизация с неверным паролем
**Preconditions:** Пользователь существует в системе
**Steps to reproduce:**
1. Отправить POST /auth/login с корректным username и неверным password
**Expected result:**
Статус код 400/401
В ответе присутствует сообщение об ошибке
**Priority:** Высокий

### ID: TC-003
**Title:** Авторизация без обязательных полей
**Preconditions:** Пользователь существует в системе
**Steps to reproduce:**
1. Отправить POST /auth/login с корректным username и без password
**Expected result:**
Статус код 400
Сообщение о валидационной ошибке
**Priority:** Средний

### ID: TC-004
**Title:** Обновление access token по refresh token
**Preconditions:** Пользователь авторизован
**Steps to reproduce:**
1. Отправить POST /auth/refresh с валидным refreshToken
**Expected result:**
Статус код 200
Возвращается новый accessToken
**Priority:** Средний

# PRODUCTS

### ID: TC-005
**Title:** Получение списка товаров
**Preconditions:** Пользователь авторизован
**Steps to reproduce:**
1. Отправить GET /products
**Expected result:**
Статус код 200
В ответе присутствуют:
products (array)
total (number)
skip (number)
limit (number)
**Priority:** Высокий

### ID: TC-006
**Title:** Проверка структуры объекта товара
**Preconditions:** Пользователь авторизован
**Steps to reproduce:**
1. Отправить GET /products
2. Проверить первый объект в массиве
**Expected result:**
Товар содержит:
id (number)
title (string)
price (number)
description (string)
**Priority:** Средний

### ID: TC-007
**Title:** Получение товара по валидному ID
**Preconditions:** Пользователь авторизован
**Steps to reproduce:**
1. Отправить GET /products/1
**Expected result:**
Статус код 200
Возвращен корректный товар
**Priority:** Высокий

### ID: TC-008
**Title:** Получение товара по несуществуещему ID
**Preconditions:** Пользователь авторизован
**Steps to reproduce:**
1. Отправить GET /products/999999
**Expected result:**
Статус код 404
Корректное сообщение об ошибке
**Priority:** Средний

### ID: TC-009
**Title:** Создание нового товара
**Preconditions:** Пользователь авторизован
**Steps to reproduce:**
1. Отправить POST /products/add с валидными данными
**Expected result:**
Статус код 201
В ответе присутствует id созданного товара
**Priority:** Высокий

### ID: TC-010
**Title:** Создание товара без обязательного поля
**Preconditions:** Пользователь авторизован
**Steps to reproduce:**
1. Отправить POST /products/add без title
**Expected result:**
Статус код 400
Корректное сообщение об ошибке
**Priority:** Средний

### ID: TC-011
**Title:** Обновление существующего товара
**Preconditions:** Пользователь авторизован
**Steps to reproduce:**
1. Отправить PUT /products/{id} с измененным title
**Expected result:**
Статус код 200
Данные товара обновлены
**Priority:** Средний

### ID: TC-012
**Title:** Удаление существующего товара
**Preconditions:** Пользователь авторизован
**Steps to reproduce:**
1. Отправить DELETE /products/{id}
**Expected result:**
Статус код 200
Товар помечен как удаленный
**Priority:** Средний

### ID: TC-013
**Title:** Удаление несуществующего товара
**Preconditions:** Пользователь авторизован
**Steps to reproduce:**
1. Отправить DELETE /products/999999
**Expected result:**
Статус код 404
**Priority:** Низкий

# CART

### ID: TC-014
**Title:** Добавление товара в корзину
**Preconditions:** Пользователь авторизован
**Steps to reproduce:**
1. Отправить POST /carts/add с валидными userId и productId
**Expected result:**
Статус код 200
В ответе присутствует:
id корзины
products (array)
total
**Priority:** Высокий

### ID: TC-015
**Title:** Добавление товара с невалидным productId
**Preconditions:** Пользователь авторизован
**Steps to reproduce:**
1. Отправить POST /carts/add с несуществующим productId
**Expected result:**
Статус код 400 или ошибка валидации
**Priority:** Средний

### ID: TC-016
**Title:** Получение корзины пользователя
**Preconditions:** Пользователь авторизован
**Steps to reproduce:**
1. Отправить GET /carts/user/{userId}
**Expected result:**
Статус код 200
Возвращается массив корзин
**Priority:** Средний

### ID: TC-017
**Title:** Проверка расчета total в корзине
**Preconditions:** Пользователь авторизован
**Steps to reproduce:**
1. Добавить несколько товаров
2. Проверить значение total
**Expected result:**
total = сумма price * quantity
**Priority:** Средний

# FULL FLOW

### ID: TC-018
**Title:** Полный сценарий: login - создание товара - получение - удаление
**Preconditions:** Пользователь существует в системе
**Steps to reproduce:**
1. Авторизация
2. Создание товара
3. Получение созданного товара
4. Удаление товара
**Expected result:**
Все шаги выполняются успешно
Статус коды корректны
**Priority:** Высокий

### ID: TC-019
**Title:** Проверка времени ответа API
**Preconditions:** Пользователь существует в системе
**Steps to reproduce:**
1. Отправить любой GET запрос
**Expected result:**
Время ответа < 1000 мс
**Priority:** Низкий

### ID: TC-020
**Title:** Проверка Content-type ответа
**Preconditions:** Пользователь существует в системе
**Steps to reproduce:**
1. Отправить GET /products
**Expected result:**
Заголовок Content-type = application/json
**Priority:** Средний