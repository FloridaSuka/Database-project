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




--Querys
-- 1)Listoni të gjithë konsumatorët që janë nga qyteti i Prishtinës.

SELECT kid AS id, kemri AS emri, kmbiemri AS mbiemri 
FROM konsumatori
WHERE kadresa = 'Prishtine';

--2)  Cilët konsumatorë (Emrin dhe Mbiemrin e tyre) kanë rezervuar te pakten dy here gjate vitit 2022? 
 SELECT k.kemri AS emri, k.kmbiemri AS mbiemri
 FROM rezervimet r
JOIN konsumatori k ON r.Kid = k.Kid
WHERE EXTRACT(YEAR FROM r.datarezervimit) = 2022
GROUP BY k.kemri, k.kmbiemri
HAVING COUNT(*) >= 2;

--3) Listoni konsumatoret te cilet e kane anuluar rezervimin e tyre te pakten nje here gjate vitit 2021 ose 2022. 
SELECT 
    k.kid AS id, 
    k.kemri AS emri, 
    k.kmbiemri AS mbiemri,
	k.ktelefoni AS telefoni,
	k.kadresa AS adresa
FROM 
    Rezervimet r
JOIN 
    Konsumatori k
ON 
    r.kid = k.kid
WHERE 
    r.vitiAnulimit = 2021 
    OR r.vitiAnulimit = 2022;

--4)Listoni stafin që kanë pagën mbi 500 euro (emer, mbiemer) ose konsumatoret qe kane rezevuar me --daten 01/01/2023 (emer,mbiemer) 
SELECT 
  semri AS emri, 
  smbiemri AS mbiemri 
FROM 
   stafi
WHERE 
   paga>500
UNION
SELECT 
   kemri AS emri, 
   kmbiemri AS mbiemri 
FROM
   konsumatori 
WHERE 
   kid IN(
	SELECT rezervimet.kid
	FROM rezervimet
	WHERE dataRezervuar ='2023-01-01'
);

-- 5) Listoni top 5 porosite me numrin me te madh të artikujve në 3 muajt e fundit. Lista të --paraqes të dhënat e konsumatorit qe ka bere porosine duke përfshirë emrin e mbiemrin, --numrin e produkteve ne porosi dhe kamarierin qe i ka sherbyer. 
SELECT 
    k.kemri AS Konsumatori_Emri,
    k.kmbiemri AS Konsumatori_Mbiemri,
    s.semri AS Kamarieri_Emri,
    s.smbiemri AS Kamarieri_Mbiemri,
    array_length(string_to_array(p.Artikujt, ','), 1) AS Nr_Artikujve
FROM Porosia p
JOIN Tavolina t ON p.tid = t.tid
LEFT JOIN Rezervimet r ON t.tid = r.tid
LEFT JOIN Konsumatori k ON r.kid = k.kid
JOIN Stafi s ON p.sid = s.sid
WHERE p.Data_e_porosise >= CURRENT_DATE - INTERVAL '3 months'
ORDER BY Nr_Artikujve DESC
LIMIT 5;

--6)Gjeni shumen e fituar nga te gjitha porosite, te ndare ne muaj Tetor, Nentor, Dhjetor (te vitit --2022). Rezultati duhet te jete nje tabele te ka fushat Viti, Muaji, Shuma. (Tip: Porosia ka --artikuj, artikujt e kane cmimin te menyja)

WITH Artikujt_ndare AS (
    SELECT 
        p.pid,
        p.Data_e_porosise,
        TRIM(unnested_ushqimi) AS ushqimi
    FROM 
        Porosia p,
        UNNEST(STRING_TO_ARRAY(p.Artikujt, ',')) AS unnested_ushqimi
),

Porosi_Cmimi AS (
    SELECT 
        a.Data_e_porosise,
        m.cmimi
    FROM 
        Artikujt_ndare a
    JOIN 
        Menu m ON a.ushqimi = m.ushqimi
),

Shuma_Muaj AS (
    SELECT 
        EXTRACT(YEAR FROM Data_e_porosise) AS Viti,
        TO_CHAR(Data_e_porosise, 'Month') AS Muaji,
        SUM(cmimi) AS Shuma
    FROM 
        Porosi_Cmimi
    WHERE 
        EXTRACT(YEAR FROM Data_e_porosise) = 2022
        AND EXTRACT(MONTH FROM Data_e_porosise) IN (10, 11, 12)
    GROUP BY 
        EXTRACT(YEAR FROM Data_e_porosise),
        TO_CHAR(Data_e_porosise, 'Month')
)

SELECT * FROM Shuma_Muaj;


--7)Gjeni mesataren e rezervimeve (booking) per secilen dite te javes gjate 
--muajve Korrik dhe Gusht. Rezultati duhet te permbaje: 
--Diten (e hene, e marte,....)
--Numri mesatar i rezervimeve ne periudhen e cekur
--Tip: Tek tabela rezervimi e keni daten, nga aty m e ndonje funksion te mysql e merrni muajin ose vetem diten.


SELECT 
    TO_CHAR(dataRezervuar, 'Day') AS "Dita",
    ROUND(COUNT(rid) *1.0 / COUNT(DISTINCT dataRezervuar),2) AS "Mesatarja"
FROM 
    Rezervimet
WHERE 
    EXTRACT(MONTH FROM dataRezervuar) IN (7, 8)
GROUP BY 
    TO_CHAR(dataRezervuar, 'Day');

--8)  Gjeni top produktin me te preferuar per vitin aktual qe eshte ushqim dhe jo pije. 
  
                             
WITH Artikujt_e_Ndare AS (
    SELECT 
        trim(unnest(string_to_array(Artikujt, ','))) AS Artikulli,
        Data_e_porosise
    FROM Porosia
    WHERE EXTRACT(YEAR FROM Data_e_porosise) = EXTRACT(YEAR FROM CURRENT_DATE)
),
Filtruar AS (
    SELECT 
        a.Artikulli
    FROM Artikujt_e_Ndare a
    JOIN Menu m ON trim(lower(a.Artikulli)) = trim(lower(m.ushqimi))
    WHERE m.kategoria NOT IN ('Pije') 
),
Numrimi AS (
    SELECT 
        Artikulli,
        COUNT(*) AS Nr_Heresh
    FROM Filtruar
    GROUP BY Artikulli
)
SELECT 
    Artikulli,
    Nr_Heresh
FROM Numrimi
ORDER BY Nr_Heresh DESC
LIMIT 1;


--9)  Gjeni porositë ne te cilat kane minumum 3 produkte me kategorine Pica.
         
SELECT
  pid, Artikujt
FROM 
  porosia
WHERE 
    LOWER(Artikujt) LIKE '%pica%' AND
    (
        LOWER(Artikujt) LIKE '%pica%' || ',%' || '%pica%' || ',%'
    );






