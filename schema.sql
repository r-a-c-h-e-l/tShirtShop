DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS transactions;

CREATE TABLE items (
  id INTEGER PRIMARY KEY,
  name TEXT,
  description TEXT,
  item_type TEXT,
  qty INTEGER,
  item_id TEXT,
  image_url TEXT DEFAULT ".public/images/not_found.jpg",
  price REAL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  firstName TEXT,
  lastName TEXT,
  email TEXT
);

CREATE TABLE transactions (
  id INTEGER PRIMARY KEY,
  item_id TEXT references items,
  user_id TEXT references users,
  transaction_id TEXT,
  purchase_qty INTEGER,
  purchased_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TRIGGER itemChange BEFORE UPDATE ON items BEGIN
  UPDATE items SET updated_at= CURRENT_TIMESTAMP WHERE ID = new.id;
END;

CREATE TRIGGER itemPurchase BEFORE UPDATE ON transactions BEGIN
  UPDATE items SET purchased_at= CURRENT_TIMESTAMP WHERE ID = new.id;
END;
