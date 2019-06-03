CREATE OR REPLACE FUNCTION GETDURATION (dur IN NUMERIC DEFAULT 0)
RETURN VARCHAR AS 
durStr VARCHAR(20);
BEGIN
  durStr := trunc(dur)||' ч. '||(dur-trunc(dur))*100||' м.';
  RETURN durStr;
END GETDURATION;

CREATE OR REPLACE PROCEDURE GETPARTICIPANTS (filmNameIN IN VARCHAR) AS
firstPers NUMERIC(1);
BEGIN
    FOR info IN (SELECT id, filmName, studio, releaseYear, country, duration, genre FROM films
    WHERE filmName LIKE filmNameIn)
    LOOP
        dbms_output.put_line(info.filmName||' ('||info.releaseYear||', '||getduration(info.duration)||')');
        dbms_output.put_line('Жанр: '||info.genre);
        
        dbms_output.put('Режиссер(ы): ');
        firstPers := 0;
        FOR smth IN (SELECT p.lfp FROM persons p, creators c
        WHERE c.PersonID = p.ID AND c.participationCharacter LIKE 'Режиссер')
        LOOP
            IF firstPers = 0 THEN
                dbms_output.put(smth.lfp);
                firstPers := 1;
            ELSE
                dbms_output.put(', '||smth.lfp);
            END IF;
        END LOOP;
        IF firstPers = 0 THEN
            dbms_output.put_line('нет данных');
        ELSE
            dbms_output.put_line('');
        END IF;
        
        dbms_output.put('Сценарист(ы): ');
        firstPers := 0;
        FOR smth IN (SELECT p.lfp FROM persons p, creators c
        WHERE c.PersonID = p.ID AND c.participationCharacter LIKE 'Сценарист')
        LOOP
            IF firstPers = 0 THEN
                dbms_output.put(smth.lfp);
                firstPers := 1;
            ELSE
                dbms_output.put(', '||smth.lfp);
            END IF;
        END LOOP;
        IF firstPers = 0 THEN
            dbms_output.put_line('нет данных');
        ELSE
            dbms_output.put_line('');
        END IF;
        
        dbms_output.put('Оператор(ы): ');
        firstPers := 0;
        FOR smth IN (SELECT p.lfp FROM persons p, creators c
        WHERE c.PersonID = p.ID AND c.participationCharacter LIKE 'Оператор')
        LOOP
            IF firstPers = 0 THEN
                dbms_output.put(smth.lfp);
                firstPers := 1;
            ELSE
                dbms_output.put(', '||smth.lfp);
            END IF;
        END LOOP;
        IF firstPers = 0 THEN
            dbms_output.put_line('нет данных');
        ELSE
            dbms_output.put_line('');
        END IF;
        
        dbms_output.put('Композитор(ы): ');
        firstPers := 0;
        FOR smth IN (SELECT p.lfp FROM persons p, creators c
        WHERE c.PersonID = p.ID AND c.participationCharacter LIKE 'Композитор')
        LOOP
            IF firstPers = 0 THEN
                dbms_output.put(smth.lfp);
                firstPers := 1;
            ELSE
                dbms_output.put(', '||smth.lfp);
            END IF;
        END LOOP;
        IF firstPers = 0 THEN
            dbms_output.put_line('нет данных');
        ELSE
            dbms_output.put_line('');
        END IF;
        
        dbms_output.put_line('Актеры:');
        FOR smth IN (SELECT p.lfp FROM persons p, creators c
        WHERE c.PersonID = p.ID AND c.participationCharacter IS NULL)
        LOOP
            dbms_output.put_line(smth.lfp);
        END LOOP;
    END LOOP;
    
END GETPARTICIPANTS;
