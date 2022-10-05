DROP TABLE IF EXISTS customer CASCADE;
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    age INTEGER 
);

INSERT INTO customer(
    first_name,
    last_name,
    email,
    age
) VALUES(
    'Connor',
    'Fuller',
    'cf@gmail.com',
    27
);
INSERT INTO customer(
    first_name,
    last_name,
    email,
    age
)
VALUES(
    'John',
    'Doe',
    'JohnDeer@gmail.com',
    33
);
INSERT INTO customer(
    first_name,
    last_name,
    email,
    age
)
VALUES(
    'Kevin',
    'Rodriguez',
    'KevRiguez@gmail.com',
    23
)



DROP TABLE IF EXISTS movie CASCADE;
CREATE TABLE movie(
    movie_id SERIAL PRIMARY KEY,
    category VARCHAR(100),
    title VARCHAR(50),
    rating NUMERIC(5,2)
);
INSERT INTO movie(
    category,
    title,
    rating
)VALUES(
    'Comedy',
    'Kevin Sneezes: The Return of The Sneeze',
    0.1
);
INSERT INTO movie(
    category,
    title,
    rating
)VALUES(
    'Comedy',
    'Marcus Asks Connor To Turn on His Webcam...again',
    9.0
);
INSERT INTO movie(
    category,
    title,
    rating
)VALUES(
    'Horror',
    'Not another Election',
    5.5
)


DROP TABLE IF EXISTS concession CASCADE;
CREATE TABLE concession(
    concession_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    drinks VARCHAR(100),
    foods VARCHAR(50),
    snacks VARCHAR(50),
    price NUMERIC(5,2),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
INSERT INTO concession(
    customer_id,
    drinks,
    foods,
    snacks,
    price
)
VALUES(
    1,
    'Coke',
    'Popcorn',
    'M&Ms',
    45.00
);
INSERT INTO concession(
    customer_id,
    drinks,
    foods,
    snacks,
    price
)
VALUES(
    2,
    'Dr.Pepper',
    'Pretzels & Cheese',
    'Twix',
    35.00
);
INSERT INTO concession(
    customer_id,
    drinks,
    foods,
    snacks,
    price
)
VALUES(
    3,
    'Sprite',
    'Popcorn',
    'Crunch',
    55.00
)

DROP TABLE IF EXISTS tickets CASCADE;
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    movie_id INTEGER,
    price NUMERIC (5,2),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
)

INSERT into tickets(
    customer_id,
    movie_id,
    price
) VALUES(
    1,
    1,
    9.99
);
INSERT into tickets(
    customer_id,
    movie_id,
    price
) VALUES(
    2,
    2,
    6.99
);
INSERT into tickets(
    customer_id,
    movie_id,
    price
) VALUES(
    3,
    3,
    10.99
)

DROP TABLE IF EXISTS purchase CASCADE;
CREATE TABLE purchase(
    purchase_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    ticket_id INTEGER,
    concession_id INTEGER,
    price NUMERIC(5,2),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id),
    FOREIGN KEY (concession_id) REFERENCES concession(concession_id)
);

INSERT into purchase(
    purchase_id,
    customer_id,
    ticket_id,
    concession_id,
    price
) VALUES(
    1,
    1,
    1,
    1,
    99.99
);
INSERT into purchase(
    purchase_id,
    customer_id,
    ticket_id,
    concession_id,
    price
) VALUES(
    2,
    2,
    2,
    2,
    79.99
);
INSERT into purchase(
    purchase_id,
    customer_id,
    ticket_id,
    concession_id,
    price
) VALUES(
    3,
    3,
    3,
    5,
    99.99
)
