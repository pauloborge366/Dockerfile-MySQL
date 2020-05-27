CREATE USER "remote"@"172.17.0.%" IDENTIFIED BY "1234";

CREATE DATABASE IF NOT EXISTS db_news;

CREATE TABLE IF NOT EXISTS db_news.tb_presenters (
  id INT(11) AUTO_INCREMENT,
  name VARCHAR(255),
  age TINYINT,
  PRIMARY KEY (id)
);

INSERT INTO db_news.tb_presenters (name, age)
VALUES
  ("William Bonner", 56),
  ("Renata Vasconcellos", 47),
  ("Maria Júlia Coutinho", 41);

  GRANT ALL PRIVILEGES ON db_news.tb_presenters TO "remote"@"172.17.0.%";
  FLUSH PRIVILEGES;