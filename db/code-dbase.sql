CREATE USER "remote"@"172.17.0.%" IDENTIFIED BY "1234";

CREATE DATABASE IF NOT EXISTS db_news;
ALTER SCHEMA db_news DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS db_news.tb_presenters (
  i_id INT(11) AUTO_INCREMENT,
  c_name VARCHAR(255) NOT NULL,
  c_program VARCHAR(255),
  i_age SMALLINT(3),
  PRIMARY KEY (i_id)
);

INSERT INTO db_news.tb_presenters (c_name, c_program, i_age)
VALUES
  ("William Bonner", "Jornal Nacional", 56),
  ("Renata Vasconcellos", "Jornal Nacional", 47),
  ("Maria Júlia Coutinho", "Jornal Hoje", 41),
  ("Renata Lo Prete", "Jornal da Globo", 55);

  GRANT ALL PRIVILEGES ON db_news.tb_presenters TO "remote"@"172.17.0.%";
  FLUSH PRIVILEGES;