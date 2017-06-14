DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE items;
DROP TABLE users;

CREATE TABLE merchants(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  image_link VARCHAR(255)
);

CREATE TABLE items(
  id SERIAL8 PRIMARY KEY,
  type VARCHAR(255),
  total INT
);

CREATE TABLE users(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  balance DECIMAL(9,2)
);

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  amount DECIMAL(9,2),
  purchase_date DATE,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  item_id INT8 REFERENCES items(id) ON DELETE CASCADE
);