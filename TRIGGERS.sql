CREATE OR REPLACE TRIGGER FILMTRIGGER 
BEFORE INSERT OR UPDATE ON Films
FOR EACH ROW
BEGIN
    IF :new.duration <= 0.10 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Duration sholud be > 10 min');
    END IF;
    
    IF :new.releaseYear IS NULL THEN
        :new.releaseYear := extract(year from sysdate);
    END IF;
    
    IF :new.releaseYear > extract(year from sysdate) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Release year cannot be in future');
    END IF;
    
    IF :new.country IN ('��', '���������� ���������')  THEN
        :new.country := '������';
    END IF;
    
    IF :new.country LIKE '��������������'  THEN
        :new.country := '������';
    END IF;
    
    IF :new.country LIKE '���'  THEN
        :new.country := '�����';
    END IF;
END;

INSERT INTO Films VALUES (5, '�����', '��������', NULL, '��', 01.24, '������');

CREATE OR REPLACE TRIGGER FILMTRIGGERDEL 
BEFORE DELETE ON Films
FOR EACH ROW
BEGIN
    INSERT INTO ArchiveTab VALUES (sysdate, user, :old.filmName);
END;

DELETE FROM Films WHERE id = 5;

SELECT * FROM ArchiveTab;

