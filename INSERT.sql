INSERT INTO Genres VALUES ('�����');
INSERT INTO Genres VALUES ('����������');
INSERT INTO Genres VALUES ('�������');
INSERT INTO Genres VALUES ('������');

INSERT INTO Films VALUES (1, '����� �� ��������', 'Castle Rock Entertainment', 1994, '���', 02.22, '�����');
INSERT INTO Films VALUES (2, '������� ��������', '���� ����������', 1970, '����', 0.20, '�������');
INSERT INTO Films VALUES (3, '�������', '��������', 1979, '����', 02.43, '����������');
INSERT INTO Films VALUES (4, '�������', '��������', 1947, '����', 01.24, '������');

INSERT INTO Persons VALUES (1, '����� ���������', '����', DATE '1896-08-27', DATE '1984-07-19');
INSERT INTO Persons VALUES (2, '��������� ������������', '����', DATE '1946-07-23', DATE '1995-12-03');
INSERT INTO Persons VALUES (3, '��� �������', '���', DATE '1958-10-16', NULL);

INSERT INTO Creators VALUES (1, 3, NULL, '���� �������');
INSERT INTO Creators VALUES (2, 1, NULL, '������ ���');
INSERT INTO Creators VALUES (3, 2, NULL, '������� �����');
INSERT INTO Creators VALUES (4, 1, NULL, '�������');

INSERT INTO Persons VALUES (4, '������� ������', '����', DATE '1945-07-23', DATE '2018-12-03');
INSERT INTO Creators VALUES (4, 4, '��������', NULL);