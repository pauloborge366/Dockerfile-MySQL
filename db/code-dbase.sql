CREATE USER "remote"@"172.17.0.%" IDENTIFIED BY "1234";

CREATE DATABASE IF NOT EXISTS db_news;
ALTER SCHEMA db_news DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci;

USE db_news;

CREATE TABLE IF NOT EXISTS tb_stations (
  stat_id INT(11) UNSIGNED AUTO_INCREMENT,
  stat_name VARCHAR(100) NOT NULL,
  stat_property VARCHAR(255),
  stat_founderName VARCHAR(255),
  stat_foundedDate DATE,
  stat_accessWay VARCHAR(100) DEFAULT 'N/A',
  PRIMARY KEY (stat_id)
);

INSERT INTO tb_stations (stat_name, stat_property, stat_founderName, stat_foundedDate, stat_accessWay)
VALUES ('Rede Globo', 'Grupo Globo', 'Roberto Marinho', '1965-04-25', 'Canal 11'),
('SBT', 'Grupo Silvio Santos', 'Silvio Santos', '1981-08-19', 'Canal 4'),
('RecordTV', 'Grupo Record', 'Paulo Machado de Carvalho', '1953-09-27', 'Canal 5'),
('Band', 'Grupo Bandeirantes de Comunicação', 'João Jorge Saad', '1967-05-13', 'Canal 7'),
('YouTube', 'Google', 'Jawed Karim, Steve Chen e Chad Hurley', '2005-02-14', 'http://youtube.com');


CREATE TABLE IF NOT EXISTS tb_presenters (
  pres_id INT(11) UNSIGNED AUTO_INCREMENT,
  pres_name VARCHAR(255) NOT NULL,
  pres_program VARCHAR(255),
  pres_age SMALLINT(3),
  stat_id INT(11) UNSIGNED,
  PRIMARY KEY (pres_id),
  CONSTRAINT fk_stations FOREIGN KEY (stat_id) REFERENCES tb_stations(stat_id)
);

INSERT INTO tb_presenters (pres_name, pres_program, pres_age, stat_id)
VALUES
  ("William Bonner", "Jornal Nacional", 56, 1),
  ("Renata Vasconcellos", "Jornal Nacional", 47, 1),
  ("Maria Júlia Coutinho", "Jornal Hoje", 41, 1),
  ("Renata Lo Prete", "Jornal da Globo", 55, 1),
  ("Claudio Zaidan", "Bandeirantes Acontece", 59, 5),
  ("Ronald Gimenez", "Bandeirantes Acontece", 48, 5);

  GRANT ALL PRIVILEGES ON db_news.* TO "remote"@"172.17.0.%";
  FLUSH PRIVILEGES;