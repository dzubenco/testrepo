Шаг 1: Создание исходных таблиц и наполнение данными

-- Таблица с курсами валют
CREATE TABLE currency_rate (
    currency_code VARCHAR2(10),
    rate_to_usd NUMBER(10, 4),
    rate_date DATE
);

-- Таблица с продуктами и их ценами
CREATE TABLE product_price (
    product_id NUMBER,
    product_name VARCHAR2(100),
    price NUMBER(10, 2),
    currency_code VARCHAR2(10),
    price_date DATE
);

-- Наполняем данными за первый день (например, 10 июня)
INSERT INTO currency_rate VALUES ('USD', 1, DATE '2025-06-10');
INSERT INTO currency_rate VALUES ('EUR', 1.08, DATE '2025-06-10');
INSERT INTO currency_rate VALUES ('JPY', 0.0065, DATE '2025-06-10');

INSERT INTO product_price VALUES (1, 'Milk', 2.5, 'USD', DATE '2025-06-10');
INSERT INTO product_price VALUES (2, 'Bread', 2.0, 'EUR', DATE '2025-06-10');
INSERT INTO product_price VALUES (3, 'Sushi', 500, 'JPY', DATE '2025-06-10');

COMMIT;

📌 Шаг 2: Целевая таблица для хранения цен в долларах (пересчитанных)

CREATE TABLE product_price_usd (
    load_date DATE,
    product_id NUMBER,
    product_name VARCHAR2(100),
    original_price NUMBER(10, 2),
    currency_code VARCHAR2(10),
    usd_price NUMBER(10, 2)
);

📌 Шаг 3: Full Load скрипт (например, за 10 июня)

-- Удаляем старые данные (важный шаг для full load)
DELETE FROM product_price_usd
WHERE load_date = DATE '2025-06-10';

-- Вставляем новые данные
INSERT INTO product_price_usd (load_date, product_id, product_name, original_price, currency_code, usd_price)
SELECT 
    p.price_date,
    p.product_id,
    p.product_name,
    p.price,
    p.currency_code,
    ROUND(p.price / r.rate_to_usd, 2) AS usd_price
FROM 
    product_price p
JOIN 
    currency_rate r ON p.currency_code = r.currency_code AND p.price_date = r.rate_date
WHERE 
    p.price_date = DATE '2025-06-10';

COMMIT;

📌 Шаг 4: Новый день — новые данные (например, 11 июня)

-- Новые курсы
INSERT INTO currency_rate VALUES ('USD', 1, DATE '2025-06-11');
INSERT INTO currency_rate VALUES ('EUR', 1.10, DATE '2025-06-11');
INSERT INTO currency_rate VALUES ('JPY', 0.0067, DATE '2025-06-11');

-- Новые цены
INSERT INTO product_price VALUES (1, 'Milk', 2.6, 'USD', DATE '2025-06-11');
INSERT INTO product_price VALUES (2, 'Bread', 2.1, 'EUR', DATE '2025-06-11');
INSERT INTO product_price VALUES (3, 'Sushi', 520, 'JPY', DATE '2025-06-11');

COMMIT;

📌 Шаг 5: Новый Full Load за 11 июня

DELETE FROM product_price_usd
WHERE load_date = DATE '2025-06-11';

INSERT INTO product_price_usd (load_date, product_id, product_name, original_price, currency_code, usd_price)
SELECT 
    p.price_date,
    p.product_id,
    p.product_name,
    p.price,
    p.currency_code,
    ROUND(p.price / r.rate_to_usd, 2) AS usd_price
FROM 
    product_price p
JOIN 
    currency_rate r ON p.currency_code = r.currency_code AND p.price_date = r.rate_date
WHERE 
    p.price_date = DATE '2025-06-11';

COMMIT;

⚠️ Почему Full Load — это неэффективно на больших объемах

    Каждый день система удаляет и пересчитывает все записи, даже если большинство из них не менялись.

    При большом количестве данных (миллионы строк) это:

        Увеличивает нагрузку на БД (CPU, IO, транзакции).

        Приводит к блокировкам и конкуренции за ресурсы.

        Затрудняет аудит — теряется история изменений.

    Лучше использовать Incremental Load или Change Data Capture, чтобы загружать только измененные или новые записи.
