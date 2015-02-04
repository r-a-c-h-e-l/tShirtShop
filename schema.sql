DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS administrators;

CREATE TABLE items (
  id INTEGER PRIMARY KEY,
  name TEXT,
  description TEXT,
  item_type TEXT,
  qty INTEGER,
  item_id TEXT,
  image_url TEXT DEFAULT ".public/images/not_found.jpg",
  price DOUBLE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  user_id TEXT,
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

CREATE TABLE administrators (
  id INTEGER PRIMARY KEY,
  username TEXT,
  password TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TRIGGER itemChange BEFORE UPDATE ON items BEGIN
  UPDATE items SET updated_at= CURRENT_TIMESTAMP WHERE ID = new.id;
END;

CREATE TRIGGER authentication_admin BEFORE UPDATE ON administrators BEGIN
  UPDATE administrators SET updated_at = CURRENT_TIMESTAMP WHERE id = new.id;
END;
