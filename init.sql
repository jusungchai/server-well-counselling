DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS profiles CASCADE;
DROP TABLE IF EXISTS checklists CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,  
  firstName VARCHAR(255) NOT NULL,
  lastName VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(255) NOT NULL
);

CREATE TABLE profiles (
  id SERIAL PRIMARY KEY NOT NULL,
  userId INT REFERENCES users(id),  
  title VARCHAR(255) NOT NULL,
  avatar VARCHAR(255) NOT NULL
);

CREATE TABLE checklists (
  id SERIAL PRIMARY KEY NOT NULL,
  data JSON NOT NULL
);


INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne1', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne2', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne3', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne4', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne5', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne6', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne7', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne8', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne9', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne10', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne11', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay@gmail.com', '4162793971');


INSERT INTO profiles(userId, title, avatar)
VALUES (1, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

INSERT INTO profiles(userId, title, avatar)
VALUES (2, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

INSERT INTO profiles(userId, title, avatar)
VALUES (3, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

INSERT INTO profiles(userId, title, avatar)
VALUES (4, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

INSERT INTO profiles(userId, title, avatar)
VALUES (5, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

INSERT INTO profiles(userId, title, avatar)
VALUES (6, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

INSERT INTO profiles(userId, title, avatar)
VALUES (7, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

INSERT INTO profiles(userId, title, avatar)
VALUES (8, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

INSERT INTO profiles(userId, title, avatar)
VALUES (9, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

INSERT INTO profiles(userId, title, avatar)
VALUES (10, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

INSERT INTO profiles(userId, title, avatar)
VALUES (11, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');



INSERT INTO checklists(data)
VALUES ('{
  "emoticon": "https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/10/자존심.png",
  "msgKr": "자존감 하락이에요",
  "msgEn": "It''s a drop in self-esteem",
  "link": "https://docs.google.com/forms/d/e/1FAIpQLSevBhUT61AmmXx8jEvKE4CiG_1R8S1dXh0f8Kh9S2GNixsd7A/viewform?vc=0&c=0&w=1"
}');

INSERT INTO checklists(data)
VALUES ('{
  "emoticon": "https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/10/스트레스.png",
  "msgKr": "스트레스가 많아요",
  "msgEn": "It''s stressful",
  "link": "https://docs.google.com/forms/d/e/1FAIpQLSe8Kee__jZriy0ky-andpKOerXMI_DxJQyE8S-ZGaHVEWMy_A/viewform?vc=0&c=0&w=1"
}');

INSERT INTO checklists(data)
VALUES ('{
  "emoticon": "https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/10/우울.png",
  "msgKr": "우울해요",
  "msgEn": "I feel depressed",
  "link": "https://docs.google.com/forms/d/e/1FAIpQLSdp-hdoMwjn64LADwAGGtaCo9y9t8yi6SUkLBQ_MiTA0koWGQ/viewform?vc=0&c=0&w=1"
}');

INSERT INTO checklists(data)
VALUES ('{
  "emoticon": "https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/10/무서워.png",
  "msgKr": "불안해요",
  "msgEn": "I''m nervous",
  "link": "https://docs.google.com/forms/d/e/1FAIpQLSc2G6mzXRZkQ08zohgG2pvoPCzrZArWMy81MP23IhbU6iIwzg/viewform?vc=0&c=0&w=1"
}');