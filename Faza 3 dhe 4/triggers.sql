-- Funksioni për trigger-in
CREATE OR REPLACE FUNCTION shto_arkatar_automatik()
RETURNS TRIGGER AS $$
BEGIN
    -- Kontrollo nëse roli është 'Kamarier' dhe fut automatikisht një 'Arkatari'
    IF NEW.roli = 'Kamarier' THEN
        INSERT INTO Stafi (sid, semri, smbiemri, numriPersonal, roli, paga, sadresa, sNrTelefonit, dataPunesimit)
        VALUES (
            NEW.sid + 1, -- ID e ri, mund ta ndryshosh sipas logjikës
            'Automatik', 
            'Arkatar',
            '999999', -- Numri personal fiktiv
            'Arkatari', 
            1200, -- Paga e paracaktuar
            'Adresa Automatike',
            '000 000 000', -- Numri telefonit fiktiv
            CURRENT_DATE -- Data aktuale e punësimit
        );
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Krijimi i Trigger-it
CREATE TRIGGER shto_arkatar_pas_kamarieri
AFTER INSERT ON Stafi
FOR EACH ROW
EXECUTE FUNCTION shto_arkatar_automatik();

-- Futje shembull për të testuar trigger-in
INSERT INTO Stafi (sid, semri, smbiemri, numriPersonal, roli, paga, sadresa, sNrTelefonit, dataPunesimit)
VALUES
(2011, 'Arber', 'Kodra', '123123', 'Kamarier', 1050, 'Adresa Shembull', '045 123 456', '2024-12-29');

-- Kontrollo të dhënat
SELECT * FROM Stafi;
--///////////////////////////////
-- Krijo një tabelë për logimin e fshirjeve
CREATE TABLE Rezervimet_Log (
    rid INTEGER,
    dataRezervimit DATE,
    dataRezervuar DATE,
    nrPersonave INTEGER,
    rpuntori INTEGER,
    koha VARCHAR(5),
    sid INTEGER,
    kid INTEGER,
    tid INTEGER,
    vitiAnulimit INTEGER,
    anulimi BOOLEAN,
    log_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    log_action VARCHAR(10)
);

-- Krijo funksionin për trigger-in
CREATE OR REPLACE FUNCTION log_fshirje_rezervimet()
RETURNS TRIGGER AS $$
BEGIN
    -- Regjistro të dhënat e rreshtit të fshirë në tabelën e logut
    INSERT INTO Rezervimet_Log (
        rid, dataRezervimit, dataRezervuar, nrPersonave, rpuntori, koha, sid, kid, tid, vitiAnulimit, anulimi, log_action
    )
    VALUES (
        OLD.rid, OLD.dataRezervimit, OLD.dataRezervuar, OLD.nrPersonave, OLD.rpuntori, OLD.koha, OLD.sid, OLD.kid, OLD.tid, OLD.vitiAnulimit, OLD.anulimi, 'DELETE'
    );
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

-- Krijo trigger-in për fshirje
CREATE TRIGGER log_on_delete_rezervimet
AFTER DELETE ON Rezervimet
FOR EACH ROW
EXECUTE FUNCTION log_fshirje_rezervimet();

-- Fshij një rresht nga tabela Rezervimet
DELETE FROM Rezervimet WHERE rid = 10006;

-- Kontrollo logun për të dhënat e fshira
SELECT * FROM Rezervimet_Log;

-- Kontrollo të dhënat e mbetura në tabelën Rezervimet
SELECT * FROM Rezervimet;



--/// views
-- update përmes një view
-- 1. Krijimi i VIEW për tabelën Stafi
CREATE OR REPLACE VIEW Stafi_View AS
SELECT sid, semri, smbiemri, numriPersonal, roli, paga, sadresa, sNrTelefonit, dataPunesimit
FROM Stafi;

-- 2. Bërja e përditësimit përmes VIEW (p.sh. ndryshimi i pagës për "Menaxher")
UPDATE Stafi_View
SET paga = 2000
WHERE sid = 2001;

-- 3. Shfaqja e ndryshimeve përmes SELECT
SELECT * FROM Stafi_View;

--////////////////////////

--multiple i tables rezervimet duke larguar dhe duke shtuar kolona 
-- 1. Krijimi i tabelës Rezervimet_Special pa disa kolona dhe me ndryshime
DROP TABLE IF EXISTS Rezervimet_Special;
CREATE TABLE Rezervimet_Special (
    rid INTEGER PRIMARY KEY,
    dataRezervimit DATE,
    dataRezervuar DATE,
    tid INTEGER,
    anulimi BOOLEAN,
    tipiRezervimit VARCHAR(20),  -- Kolonë për tipin e rezervimit (në grup, privat, etj.)
    komente TEXT,  -- Kolonë për komente
    FOREIGN KEY (tid) REFERENCES Tavolina (tid)  -- Vetëm lidhja me tabelën Tavolina
);

-- 2. Kopjimi i të dhënave nga Rezervimet në Rezervimet_Special duke i modifikuar disa kolona
INSERT INTO Rezervimet_Special (rid, dataRezervimit, dataRezervuar, tid, anulimi, tipiRezervimit, komente)
SELECT rid, dataRezervimit, dataRezervuar, tid, anulimi,
       CASE 
           WHEN rid % 2 = 0 THEN 'Grupe'  -- Nëse ID-ja e rezervimit është çifti, bëj tipin "Grupe"
           ELSE 'Privat'                -- Për të tjerat, bëj tipin "Privat"
       END AS tipiRezervimit,
       'Nuk ka komente' AS komente  -- Për momentin, nuk shtojmë komente
FROM Rezervimet;

-- 3. Shfaqja e të dhënave të tabelës Rezervimet_Special
SELECT * FROM Rezervimet_Special;

--///////////////////////////////

--single table 
-- 1. Krijimi i View për tabelën Konsumatori
DROP VIEW IF EXISTS View_Konsumatori;
CREATE VIEW View_Konsumatori AS
SELECT kid, kemri, kmbiemri, ktelefoni, kadresa
FROM Konsumatori;

-- 2. Shfaqja e të dhënave nga View_Konsumatori
SELECT * FROM View_Konsumatori;

--//Stored procedure
CREATE OR REPLACE PROCEDURE AddMenuItem(
    p_Mid INTEGER,     Kategoria VARCHAR(50),
    Ushqimi VARCHAR(100),
    Pershkrimi VARCHAR(500),
    Cmimi DECIMAL(10, 2)
)
AS $$
BEGIN
        IF NOT EXISTS (SELECT 1 FROM Menu WHERE Mid = p_Mid) THEN
        INSERT INTO Menu (Mid, Kategoria, Ushqimi, Pershkrimi, Cmimi)
        VALUES (p_Mid, Kategoria, Ushqimi, Pershkrimi, Cmimi);
    ELSE
        RAISE NOTICE 'Menu item with Mid = % already exists.', p_Mid;
    END IF;
END;
$$ LANGUAGE plpgsql;
CALL AddMenuItem(3028, 'Embëlsira', 'Tiramisu', 'Embëlsirë italiane me mascarpone.', 4.50);

--///////////
CREATE OR REPLACE PROCEDURE NdryshoCmimArtikulli(
    IN artikulli_id INT,
    IN cmimi_iRi DECIMAL(10,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
    
    UPDATE menu
    SET cmimi = cmimi_iRi
    WHERE mid = artikulli_id;
END;
$$;

CALL NdryshoCmimArtikulli(3001, 16);
--//Funksion
CREATE OR REPLACE FUNCTION CalculateBill(OrderIDs TEXT)
RETURNS DECIMAL AS $$
DECLARE
    total_amount DECIMAL := 0;
    order_id INT;
    artikulli TEXT;
    artikuj_list TEXT[];
    price DECIMAL;
BEGIN
    FOR order_id IN SELECT unnest(string_to_array(OrderIDs, ',')::int[]) LOOP
        SELECT string_to_array(p.artikujt, ',') INTO artikuj_list
        FROM porosia AS p
        WHERE p.pid = order_id;

        FOR artikulli IN SELECT unnest(artikuj_list) LOOP
            SELECT COALESCE(SUM(m.cmimi), 0) INTO price
            FROM menu AS m
            WHERE m.ushqimi = artikulli;
            total_amount := total_amount + price;
        END LOOP;
    END LOOP;
    RETURN total_amount;
END;
$$ LANGUAGE plpgsql;
SELECT CalculateBill('5001');
