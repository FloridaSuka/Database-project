--Tabela Tavolina
DROP TABLE IF EXISTS Tavolina;
CREATE TABLE Tavolina (
    tid INTEGER PRIMARY KEY,
    statusi VARCHAR(10)
);


INSERT INTO Tavolina (tid, statusi)
VALUES
(1001, 'E lire'),
(1002, 'E lire'),
(1003, 'Jo e lire'),
(1004, 'E lire'),
(1005, 'Jo e lire'),
(1006, 'Jo e lire'),
(1007, 'Jo e lire'),
(1008, 'E lire'),
(1009, 'E lire'),
(1010, 'Jo e lire');


SELECT * FROM Tavolina;


--Tabela Stafi
DROP TABLE IF EXISTS Stafi;
CREATE TABLE Stafi (
    sid INTEGER PRIMARY KEY,
    semri VARCHAR(20),
    smbiemri VARCHAR(20),
    numriPersonal VARCHAR(6) NOT NULL,
    roli VARCHAR(15),
    paga INTEGER CHECK (paga > 0),
    sadresa VARCHAR(50),
    sNrTelefonit VARCHAR(15),
    dataPunesimit DATE
);


INSERT INTO Stafi (sid, semri, smbiemri, numriPersonal, roli, paga, sadresa, sNrTelefonit, dataPunesimit)
VALUES
(2001, 'Ona', 'Aliu', '123331', 'Menaxher', 1800, 'Rruga Dardania, Nr. 15, Prishtinë', '044 123 456', '2020-07-12'),
(2002, 'Dino', 'Nishani', '232652', 'Zv.Menaxher', 1500, 'Rruga Skënderbeu, Nr. 42, Ferizaj', '049 987 654', '2021-05-13'),
(2003, 'Arta', 'Daku', '156444', 'Arkatari', 1100, 'Rruga e Kosovës, Nr. 10, Gjakovë', '044 234 567', '2023-09-01'),
(2004, 'Blerim', 'Lleshi', '236594', 'Shankist', 1000, 'Rruga Mbreti Zogu, Nr. 3, Mitrovicë', '049 876 543', '2024-03-22'),
(2005, 'Rita', 'Gashi', '222565', 'Kuzhiniere', 1350, 'Rruga Bilall Gashi, Nr. 22, Pejë', '044 345 678', '2022-12-27'),
(2006, 'Elda', 'Hoxha', '116562', 'Kuzhiniere', 1450, 'Rruga 28 Nëntori, Nr. 8, Vushtrri', '049 765 432', '2020-07-05'),
(2007, 'Noah', 'Xhemali', '122595', 'Kamarier', 1000, 'Rruga Ali Ibrahimi, Nr. 5, Rahovec', '044 456 789', '2023-11-07'),
(2008, 'Aida', 'Berisha', '264691', 'Kamariere', 1100, 'Rruga Luan Haradinaj, Nr. 14, Suharekë', '049 654 321', '2022-12-05'),
(2009, 'Sami', 'Lala', '121548', 'Kamariere', 1000, 'Rruga Hasan Prishtina, Nr. 1, Ferizaj', '044 567 890', '2023-11-07'),
(2010, 'Nora', 'Rudina', '249791', 'Pastrues', 900, 'Rruga Dëshmorët e Kombit, Nr. 11, Prizren', '049 543 210', '2020-06-12');




SELECT * FROM Stafi;


--Tabela Konsumtori
DROP TABLE IF EXISTS Konsumtori;
CREATE TABLE Konsumatori (
    kid INTEGER PRIMARY KEY,
    kemri VARCHAR(15),
    kmbiemri VARCHAR(15),
    ktelefoni VARCHAR(15),
    kadresa VARCHAR(15)
 );


INSERT INTO Konsumatori (kid, kemri, kmbiemri, ktelefoni, kadresa)
VALUES
(3001, 'Arben', 'Krasniqi', '044 123 456', 'Prishtine'),
(3002, 'Besa', 'Gashi', '049 234 567', 'Ferizaj'),
(3003, 'Driton', 'Hoxha', '045 345 678', 'Prishtine'),
(3004, 'Elira', 'Berisha', '044 456 789', 'Gjilan'),
(3005, 'Fisnik', 'Shala', '049 567 890', 'Peje'),
(3006, 'Genta', 'Dauti', '045 678 901', 'Kaçanik'),
(3007, 'Hysen', 'Mustafa', '044 789 012', 'Podujeve'),
(3008, 'Ilir', 'Ahmeti', '049 890 123', 'Malisheve'),
(3009, 'Jona', 'Limani', '045 901 234', 'Suhareke'),
(3010, 'Klodian', 'Kurti', '044 012 345', 'Peje'),
(3011, 'Erblin', 'Maloku', '048 321 112', 'Prishtine'),
(3012, 'Anita', 'Zogu', '044 334 434', 'Viti'),
(3013, 'Besart', 'Gashi', '049 787 765', 'Prishtine'),
(3014, 'Anila', 'Buzhala', '044 220 032', 'Peje');


SELECT * FROM Konsumatori;


--Tabela Rezervimet
DROP TABLE IF EXISTS Rezervimet;
CREATE TABLE Rezervimet (
    rid INTEGER PRIMARY KEY,
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
    FOREIGN KEY (sid) REFERENCES Stafi (sid),
    FOREIGN KEY (kid) REFERENCES Konsumatori (kid),
    FOREIGN KEY (tid) REFERENCES Tavolina (tid)
);


INSERT INTO Rezervimet (rid, dataRezervimit, dataRezervuar, nrPersonave, rpuntori, koha, sid, kid, tid, vitiAnulimit, anulimi)
VALUES
(10001, '2021-04-23', '2021-08-01', 2, 2001, '20:00', 2001, 3001, 1003, NULL, FALSE),
(10002, '2021-05-24', '2021-07-01', 2, 2009, '20:00', 2009, 3002, 1005, NULL, FALSE),
(10003, '2021-10-25', '2021-12-03', 4, 2007, '19:00', 2007, 3003, 1001, NULL, FALSE),
(10004, '2021-10-26', '2021-12-27', 5, 2007, '19:30', 2007, 3004, 1001, 2021, TRUE),
(10005, '2021-11-27', '2021-12-06', 3, 2009, '15:20', 2009, 3005, 1002, NULL, FALSE),
(10006, '2021-12-28', '2022-01-01', 2, 2008, '16:00', 2008, 3006, 1009, 2021, TRUE),
(10007, '2022-01-07', '2022-01-20', 10, 2002, '12:00', 2002, 3007, 1010, NULL, FALSE),
(10008, '2022-02-28', '2022-03-08', 3, 2009, '21:00', 2009, 3008, 1006, NULL, FALSE),
(10009, '2022-03-01', '2022-03-23', 5, 2007, '18:00', 2007, 3007, 1007, NULL, FALSE),
(10010, '2022-06-07', '2022-08-13', 3, 2004, '20:00', 2004, 3009, 1001, 2022, TRUE),
(10011, '2022-09-18', '2022-12-31', 2, 2009, '20:30', 2009, 3010, 1001, NULL, FALSE),
(10012, '2022-10-13', '2022-12-31', 3, 2008, '20:15', 2008, 3011, 1008, NULL, FALSE),
(10013, '2022-11-01', '2023-01-01', 3, 2004, '20:00', 2004, 3009, 1002, NULL, FALSE),
(10014, '2022-11-09', '2023-01-01', 3, 2009, '20:00', 2009, 3012, 1008, 2022, TRUE),
(10015, '2023-01-01', '2023-07-30', 3, 2008, '20:00', 2008, 3013, 1001, NULL, FALSE),
(10016, '2023-01-01', '2023-01-23', 3, 2008, '20:00', 2008, 3014, 1009, 2023, TRUE);


SELECT * FROM Rezervimet;


--Tabela Menu
DROP TABLE IF EXISTS Menu;
CREATE TABLE Menu (
    mid INTEGER PRIMARY KEY,
    kategoria VARCHAR(14),
    ushqimi VARCHAR(20),
    pershkrimi VARCHAR,
    cmimi INTEGER
);


INSERT INTO Menu (mid, kategoria, ushqimi, pershkrimi, cmimi)
VALUES
(3001, 'Antipasta', 'Chicken fingers', 'Copëza pule të skuqura me salcë dip.', 5),
(3002, 'Pjatë Kryesore', 'Pica Margarita', 'Salcë domate të freskët, mozzarella kremoze dhe gjethe borziloku aromatik.', 5),
(3003, 'Pjatë Kryesore', 'Pica Hawaii', 'Salcë domate, mozzarella të freskët, proshutë të butë dhe copa ananasi të ëmbël.', 5),
(3004, 'Pjatë Kryesore', 'Pica Pershute', 'Salcë domate aromatike, mozzarella e shkrirë dhe proshutë e shijshme e prerë hollë.', 5),
(3005, 'Pjatë Kryesore', '4 Stinet', 'Salcë domate, mozzarella, kërpudha të freskëta, ullinj, artiçokë dhe proshutë.', 10),
(3006, 'Pjatë Kryesore', 'Biftek viçi', 'Biftek viçi i pjekur me patate ose perime.', 15),
(3007, 'Pjatë Kryesore', 'Pasta Bolognese', 'Makarona me salcë tradicionale Bolognese dhe mish të grirë.', 5),
(3008, 'Pjatë Kryesore', 'Fileto salmoni', 'Fileto salmoni e pjekur me limon dhe erëza.', 15),
(3009, 'Pjatë Kryesore', 'Hamburger shtepie', 'Hamburger me mish viçi, sallatë, domate dhe djathë.', 5),



(3010, 'Pjatë Kryesore', 'Spaghetti Carbonara', 'Spaghetti të gatuar al dente, të përzier me salcë të pasur nga vezët, pecorino romano, pancetta e kripur', 7),
(3011, 'Ëmbëlsira', 'Torte çokollatë', 'Tortë e butë me çokollatë.', 3),
(3012, 'Ëmbëlsira', 'Torte biskote', 'Tortë me shtresa biskotash të buta.', 3),
(3013, 'Ëmbëlsira', 'Akullore me dredhze', 'Akullore me shije dredhze.', 5),
(3014, 'Ëmbëlsira', 'Cupcake', 'Një mini-ëmbëlsirë e butë,me krem të lehtë sipër.', 3),
(3015, 'Ëmbëlsira', 'Muffin', 'Një kek i vogël dhe i butë, i pasur me shije të ndryshme si çokollatë, boronica ose banane.', 3),
(3016, 'Pije', 'Ujë natyral', 'Ujë i freskët.', 1),
(3017, 'Pije', 'Coca-Cola', 'Pije freskuese me gaz.', 2),
(3018, 'Pije', 'Fanta', 'Pije freskuese me gaz.', 2),
(3019, 'Pije', 'IceTea', 'Pije freskuese me gaz.', 2),
(3020, 'Pije', 'Boronice', 'Pije freskuese.', 2),
(3021, 'Pije', 'Vere e kuqe', 'Pije freskuese.', 2),
(3022, 'Pije', 'Caj frutash', 'Pije e nxehte.', 2),
(3023, 'Pije', 'Caj kamomili', 'Pije e nxehte.', 2),
(3024, 'Pije', 'Espresso', 'Pije e nxehte.', 2),
(3025, 'Pije', 'Nes Vanille', 'Pije e nxehte.', 2),
(3026, 'Pije', 'Cappuccino', 'Pije e nxehte.', 2);






--Tabela porosia
DROP TABLE IF EXISTS Porosia;
CREATE TABLE Porosia (
    pid INTEGER PRIMARY KEY,
    tid INTEGER,
    sid INTEGER,
    Artikujt VARCHAR(100),
    Data_e_porosise DATE,
    Tipi VARCHAR(20),
    FOREIGN KEY (tid) REFERENCES Tavolina (tid),
    FOREIGN KEY (sid) REFERENCES Stafi (sid)
);


INSERT INTO Porosia (pid, tid, sid, Artikujt, Data_e_porosise, Tipi)
VALUES
 (5001, 1001, 2001, 'Pica Margarita,Pasta Bolognese,Uje natyral,Coca-Cola', '2024-10-01', 'Dine-in'),
 (5002, 1002, 2002, 'Spaghetti Carbonara,Fileto salmoni,Biftek viçi,Chicken fingers,Coca-Cola,IceTea,Uje natyral,Fanta', '2024-10-15', 'Delivery'),
 (5003, 1003, 2003, 'Fileto salmoni', '2022-10-02', 'Dine-in'),
 (5004, 1004, 2004, 'Biftek viçi', '2022-11-02', 'Takeaway'),
 (5005, 1005, 2005, 'Coca-Cola,Caj frutash,IceTea,Caj kamomili,Espresso,Nes Vanille,Cappuccino', '2024-10-03', 'Dine-in'),
 (5006, 1006, 2006, 'Pica Hawaii,Pica Margarita,Pica Proshute,4 Stinet,Uje natyral,Boronice,Vere e kuqe', '2024-11-10', 'Dine-in'),
 (5007, 1007, 2007, 'Pasta Bolognese', '2022-10-04', 'Delivery'),
 (5008, 1008, 2008, 'Pica Margarita,Coca-Cola', '2024-11-04', 'Dine-in'),
 (5009, 1009, 2009, 'Torte Çokollate,Cupcake,Akullore dredhze,Muffin,Torte Biskote', '2024-10-05', 'Takeaway'),
 (5010, 1010, 2010, 'Akullore me dredhze', '2022-12-05', 'Dine-in');


SELECT * FROM Porosia;
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
