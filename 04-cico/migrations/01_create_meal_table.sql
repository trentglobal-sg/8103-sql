use cico_tracker;

CREATE TABLE meals (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    identifier VARCHAR(100)
) engine = INNODB;