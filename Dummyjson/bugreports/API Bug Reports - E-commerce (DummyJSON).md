## Bug reports - E-commerce (DummyJSON)

### ID BUG-001

**Title:** PUT /products/{id} не сохраняет изменения

**Preconditions:** DummyJSON API, Postman

**Steps to reproduce:**
1. Отправить PUT /products/1 с измененным title
2. Получить товар через GET /products/1

**Actual result:**
Изменения не сохраняются. Возвращается старое значение title.

**Expected result:**
Товар должен возвращаться  обновленным значением title.

**Severity:** Major

**Priority:** High

### ID BUG-002

**Title:** DELETE /products/{id} не удаляет товар фактически

**Preconditions:** DummyJSON API, Postman

**Steps to reproduce:**
1. Отправить DELETE /products/1
2. Повторно выполнить GET /products/1

**Actual result:**
Товар продолжает возвращаться.

**Expected result:**
Удаленный товар должен быть недоступен

**Severity:** Major

**Priority:** High

### ID BUG-003

**Title:** Создание товара без обязательного поля title проходит успешно

**Preconditions:** DummyJSON API, Postman

**Steps to reproduce:**
1. Отправить POST /products/add без поля title

**Actual result:**
Сервер возвращает успешный статус.

**Expected result:**
Должна возвращаться ошибка валидации (400)

**Severity:** Major

**Priority:** High

### ID BUG-004

**Title:** Добавление товара в корзину с несуществующим productId не вызывает ошибку

**Preconditions:** DummyJSON API, Postman

**Steps to reproduce:**
1. Отправить POST /carts/add с productId = 999999

**Actual result:**
Запрос обрабатываетя успешно.

**Expected result:**
Должна возвращаться ошибка 400 или 404.

**Severity:** Major

**Priority:** Medium

### ID BUG-005

**Title:** Отсутствует валидация отрицательного значения price при создании товара

**Preconditions:** DummyJSON API, Postman

**Steps to reproduce:**
1. Отправить POST /products/add с "price": -100

**Actual result:**
Товар создается успешно.

**Expected result:**
Должна возвращаться ошибка валидации.

**Severity:** Major

**Priority:** Medium

### ID BUG-006

**Title:** API возвращает 200 при пустом теле запросе

**Preconditions:** DummyJSON API, Postman

**Steps to reproduce:**
1. Отправить POST /products/add с пустым body

**Actual result:**
Возвращается 200/201.

**Expected result:**
Должна возвращаться ошибка 400.

**Severity:** Major

**Priority:** Medium

### ID BUG-007

**Title:** Не проверяется тип данных поля "price"

**Preconditions:** DummyJSON API, Postman

**Steps to reproduce:**
1. Отправить POST /products/add с "price": "qwe"

**Actual result:**
Товар создается успешно.

**Expected result:**
Ошибка валидации типа данных.

**Severity:** Major

**Priority:** Medium

### ID BUG-008

**Title:** При обновлении товара отсутствует проверка существования ID

**Preconditions:** DummyJSON API, Postman

**Steps to reproduce:**
1. Отправить PUT /products/999999

**Actual result:**
Возвращается успешный ответ.

**Expected result:**
Ошибка 404.

**Severity:** Major

**Priority:** Medium

### ID BUG-009

**Title:** Невалидный refreshToken не всегда возвращает корректный статус ошибки

**Preconditions:** DummyJSON API, Postman

**Steps to reproduce:**
1. Отправить POST /auth/refresh с некорректным refreshToken

**Actual result:**
Возвращается 200 или некорректный статус код.

**Expected result:**
Ошибка 401 Unathorized.

**Severity:** Major

**Priority:** Medium

### ID BUG-010

**Title:** Отсутствует ограничение времени ответа API

**Preconditions:** DummyJSON API, Postman

**Steps to reproduce:**
1. Отправить GET /products
2. Замерить response time

**Actual result:**
Время ответа может превышать 1000 мс без предупреждений.

**Expected result:**
API должен соответствовать SLA (<1000 мс)

**Severity:** Minor

**Priority:** Low