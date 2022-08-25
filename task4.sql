CREATE TABLE users(user_id INT PRIMARY KEY, fname VARCHAR(20) NOT NULL);

INSERT INTO users SET user_id = 1, fname = 'Влад Телегин';
INSERT INTO users SET user_id = 2, fname = 'Иван Иванов';
INSERT INTO users SET user_id = 3, fname = 'Николай Хостинг';
INSERT INTO users SET user_id = 4, fname = 'Алексей Доменов';

CREATE TABLE domains(user_id INT NOT NULL, CONSTRAINT `fk_id` FOREIGN KEY (user_id) REFERENCES users (user_id), dname VARCHAR(80) NOT NULL);

INSERT INTO domains SET user_id = 1, dname = 'tr0th.online';
INSERT INTO domains SET user_id = 1, dname = 'tr0th.com';
INSERT INTO domains SET user_id = 1, dname = 'tr0th.ru';
INSERT INTO domains SET user_id = 2, dname = 'ivan.ru';
INSERT INTO domains SET user_id = 2, dname = 'ivan.de';
INSERT INTO domains SET user_id = 2, dname = 'ivan.eu';
INSERT INTO domains SET user_id = 2, dname = 'ivan.info';
INSERT INTO domains SET user_id = 3, dname = 'nikol.su';
INSERT INTO domains SET user_id = 3, dname = 'nikol.biz';
INSERT INTO domains SET user_id = 1, dname = 'alex.xyz';

SELECT domains.dname FROM users RIGHT JOIN domains ON users.user_id=domains.user_id WHERE fname = 'Иван Иванов';