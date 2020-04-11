DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS profiles CASCADE;
DROP TABLE IF EXISTS checklists CASCADE;
DROP TABLE IF EXISTS homeInformations CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,  
  firstName VARCHAR(255) NOT NULL,
  lastName VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  phone VARCHAR(255) NOT NULL
);

CREATE TABLE profiles (
  id SERIAL PRIMARY KEY NOT NULL,
  userId INT NOT NULL,  
  data JSON NOT NULL,
  FOREIGN KEY (userId)
    REFERENCES users (id)
    ON DELETE CASCADE
);

CREATE TABLE checklists (
  id SERIAL PRIMARY KEY NOT NULL,
  data JSON NOT NULL
);

CREATE TABLE homeInformations (
  id SERIAL PRIMARY KEY NOT NULL,
  data JSON NOT NULL
);

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne1', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay1@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne2', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay2@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne3', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay3@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne4', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay4@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne5', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay5@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne6', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay6@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne7', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay7@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne8', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay8@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne9', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay9@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne10', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay10@gmail.com', '4162793971');

INSERT INTO users(firstName, lastName, password, email, phone)
VALUES ('Wayne11', 'Chai', '$2b$10$AlzIaZxqfB3ttQZ8xqB.y.m0ZDJqkEOlaO1reCsW4p1Iinr1z4qNa', 'jay11@gmail.com', '4162793971');

INSERT INTO profiles(userId, data)
VALUES (
  1,
  '{
    "info": "JS",
    "jobTitle": "ADMIN",
    "specialField": "Developer",
    "certificate": "Everything",
    "experience": "Javascript",
    "degree": "Engineering",
    "blog": "https://google.ca",
    "avatarURL": "https://vignette.wikia.nocookie.net/hitchhikers/images/7/70/Rubberduck.jpg"
  }'
);

-- INSERT INTO profiles(userId, data)
-- VALUES (
--   3,
--   '{
--     "info": "JS",
--     "jobTitle": "ADMIN",
--     "specialField": "Developer",
--     "certificate": "Everything",
--     "experience": "Javascript",
--     "degree": "Engineering",
--     "blog": "https://google.ca"
--   }'
-- );

-- INSERT INTO profiles(userId, title, avatar)
-- VALUES (2, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

-- INSERT INTO profiles(userId, title, avatar)
-- VALUES (3, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

-- INSERT INTO profiles(userId, title, avatar)
-- VALUES (4, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

-- INSERT INTO profiles(userId, title, avatar)
-- VALUES (5, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

-- INSERT INTO profiles(userId, title, avatar)
-- VALUES (6, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

-- INSERT INTO profiles(userId, title, avatar)
-- VALUES (7, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

-- INSERT INTO profiles(userId, title, avatar)
-- VALUES (8, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

-- INSERT INTO profiles(userId, title, avatar)
-- VALUES (9, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

-- INSERT INTO profiles(userId, title, avatar)
-- VALUES (10, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');

-- INSERT INTO profiles(userId, title, avatar)
-- VALUES (11, 'DOCTORAL', 'https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/uploads/2018/08/WanSoo-Chai.jpeg');



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



INSERT INTO homeInformations(data)
VALUES ('{
  "title": "INTRODUCTION",
  "message": [
    "마음을 나눌 곳이 필요한가요? 머릿속이 복잡해 지고 있나요?",
    "누군가에게 털어놓고 싶지만 어디로 가야할지 모르겠다면, 주저하지 말고 Well Counselling을 찾아주세요.",
    "Canada Christian College의 Well Counselling 상담센터는 고민이 있으신 모든 분께 상담 서비스를 제공하기 위해 2018년 4월에 문을 열었습니다.",
    "Well Counselling은 개인상담, 집단상담, 가족상담 등을 통해서 여러분의 자신에 대한 이해를 돕고 내적 성장을 이룰 수 있도록 적극 지원하겠습니다."
  ],
  "image": {
    "url": "https://secureservercdn.net/198.71.233.204/5xi.ab1.myftpupload.com/wp-content/plugins/mesmerize-companion/theme-data/mesmerize/sections/images/about-img-5.jpg"
  }
}');

INSERT INTO homeInformations(data)
VALUES ('{
  "title": "상담 프로그램",
  "message": [
    "Well Counselling은 맞춤별 상담 프로그램을 진행합니다.",
    "개인상담, 가족상담, 집단상담, 온라인 상담 등 전문적이고 체계적인 검사와 진단을 통해 맞춤별 힐링프로그램을 진행 할 예정입니다."
  ]
}');

INSERT INTO homeInformations(data)
VALUES ('{
  "title": "개인상담",
  "message": [
    "개인상담은 인생의 한 부분에서 닥치는 여러 어려움 중에 자신이 해결하기 어려운 것을 전문 상담자와 1대 1로 그 문제를 분석하고 해결해 나가는 과정입니다.",
    "대화 과정에서 문제를 객관적으로 바라보게 되고 아울러 자기이해와 자기수용을 확장해가면서 성장 경험을 할 수 있습니다."
  ]
}');

INSERT INTO homeInformations(data)
VALUES ('{
  "title": "가족상담",
  "message": [
    "가족상담의 가장 많은 비중을 차지하는 부부상담, 부부-자녀 상담 외에 그 외 가족간의 문제, 개인문제 등을 상담합니다.",
    "우울증, 정신건강문제, 자살 등 가족구성원 개인적인 많은 문제들도 가족의 대처방법과 적응력, 가족의 정서적 관계 등과 연관성이 큰 것으로 나타납니다."
  ]
}');

INSERT INTO homeInformations(data)
VALUES ('{
  "title": "집단상담",
  "message": [
    "집단상담은 전문 상담자의 지도 아래 유사한 관심과 어려움을 가진 학생들이 소그룹으로 모여 함께 문제를 풀어나가는 상담 프로그램입니다.",
    "개인상담과 달리 집단상담은 다양한 성격과 관심을 가진 사람들이 모이므로 일상과 유사한 대인관계 경험이 가능합니다."
  ]
}');

INSERT INTO homeInformations(data)
VALUES ('{
  "title": "온라인상담",
  "message": [
    "Well Counselling에서는 온라인 상담 서비스를 제공하고 있습니다.",
    "개인적인 여건상 센터에 내방하여 상담진행이 어려운 경우 온라인을 통해 상담을 받으실 수 있습니다.",
    "온라인상담은 실명제로 운영되고 있습니다"
  ]
}');