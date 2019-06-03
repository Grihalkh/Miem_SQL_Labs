INSERT INTO Genres VALUES ('Драма');
INSERT INTO Genres VALUES ('Фантастика');
INSERT INTO Genres VALUES ('Комедия');
INSERT INTO Genres VALUES ('Мюзикл');

INSERT INTO Films VALUES (1, 'Побег из Шоушенка', 'Castle Rock Entertainment', 1994, 'США', 02.22, 'Драма');
INSERT INTO Films VALUES (2, 'Карлсон вернулся', 'Союз Мультфильм', 1970, 'СССР', 0.20, 'Комедия');
INSERT INTO Films VALUES (3, 'Сталкер', 'Мосфильм', 1979, 'СССР', 02.43, 'Фантастика');
INSERT INTO Films VALUES (4, 'Золушка', 'Ленфильм', 1947, 'СССР', 01.24, 'Мюзикл');

INSERT INTO Persons VALUES (1, 'Фаина Раневская', 'СССР', DATE '1896-08-27', DATE '1984-07-19');
INSERT INTO Persons VALUES (2, 'Александр Кайдановский', 'СССР', DATE '1946-07-23', DATE '1995-12-03');
INSERT INTO Persons VALUES (3, 'Тим Роббинс', 'США', DATE '1958-10-16', NULL);

INSERT INTO Creators VALUES (1, 3, NULL, 'Энди Дюфрейн');
INSERT INTO Creators VALUES (2, 1, NULL, 'Фрекен Бок');
INSERT INTO Creators VALUES (3, 2, NULL, 'Главный герой');
INSERT INTO Creators VALUES (4, 1, NULL, 'Золушка');

INSERT INTO Persons VALUES (4, 'Василий Пупкин', 'СССР', DATE '1945-07-23', DATE '2018-12-03');
INSERT INTO Creators VALUES (4, 4, 'Режиссер', NULL);