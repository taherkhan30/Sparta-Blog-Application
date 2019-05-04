DROP TABLE IF EXISTS post;

CREATE TABLE post (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT


);

INSERT INTO post (title,body) VALUES ('post1', 'body text 1');
INSERT INTO post (title,body) VALUES ('post1', 'body text 1');
INSERT INTO post (title,body) VALUES ('post1', 'body text 1');
INSERT INTO post (title,body) VALUES ('post1', 'body text 1');
INSERT INTO post (title,body) VALUES ('post1', 'body text 1');
