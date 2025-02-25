CREATE TABLE clients (
    noCli INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    cpo VARCHAR(10) NOT NULL,
    ville VARCHAR(50) NOT NULL
);

CREATE TABLE fiches (
    noFic INT PRIMARY KEY,
    noCli INT NOT NULL,
    dateCrea DATE NOT NULL,
    datePaiement DATE DEFAULT NULL,
    etat ENUM('SO', 'EC', 'RE') NOT NULL,
    FOREIGN KEY (noCli) REFERENCES clients(noCli)
);

CREATE TABLE tarifs (
    codeTarif VARCHAR(10) PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL,
    prixJour DECIMAL(10,2) NOT NULL
);

CREATE TABLE gammes (
    codeGam VARCHAR(10) PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL
);

CREATE TABLE categories (
    codeCate VARCHAR(10) PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL
);

CREATE TABLE grilleTarifs (
    codeGam VARCHAR(10),
    codeCate VARCHAR(10),
    codeTarif VARCHAR(10),
    PRIMARY KEY (codeGam, codeCate, codeTarif),
    FOREIGN KEY (codeGam) REFERENCES gammes(codeGam),
    FOREIGN KEY (codeCate) REFERENCES categories(codeCate),
    FOREIGN KEY (codeTarif) REFERENCES tarifs(codeTarif)
);

CREATE TABLE articles (
    refart VARCHAR(10) PRIMARY KEY,
    designation VARCHAR(100) NOT NULL,
    codeGam VARCHAR(10) NOT NULL,
    codeCate VARCHAR(10) NOT NULL,
    FOREIGN KEY (codeGam) REFERENCES gammes(codeGam),
    FOREIGN KEY (codeCate) REFERENCES categories(codeCate)
);

CREATE TABLE lignesFic (
    noFic INT,
    noLig INT,
    refart VARCHAR(10) NOT NULL,
    depart DATE NOT NULL,
    retour DATE DEFAULT NULL,
    PRIMARY KEY (noFic, noLig),
    FOREIGN KEY (noFic) REFERENCES fiches(noFic),
    FOREIGN KEY (refart) REFERENCES articles(refart)
);

//insertion des données dans les tables
USE u551032197_tp10;
INSERT INTO clients (noCli, nom, prenom, adresse, cpo, ville) VALUES 
    (1, 'Albert', 'Anatole', 'Rue des accacias', '61000', 'Amiens'),
    (2, 'Bernard', 'Barnabé', 'Rue du bar', '1000', 'Bourg en Bresse'),
    (3, 'Dupond', 'Camille', 'Rue Crébillon', '44000', 'Nantes'),
    (4, 'Desmoulin', 'Daniel', 'Rue descendante', '21000', 'Dijon'),
     (5, 'Ernest', 'Etienne', 'Rue de l’échaffaud', '42000', 'Saint Étienne'),
    (6, 'Ferdinand', 'François', 'Rue de la convention', '44100', 'Nantes'),
    (9, 'Dupond', 'Jean', 'Rue des mimosas', '75018', 'Paris'),
    (14, 'Boutaud', 'Sabine', 'Rue des platanes', '75002', 'Paris');

INSERT INTO fiches (noFic, noCli, dateCrea, datePaiement, etat) VALUES 
    (1001, 14,  DATE_SUB(NOW(),INTERVAL  15 DAY), DATE_SUB(NOW(),INTERVAL  13 DAY),'SO' ),
    (1002, 4,  DATE_SUB(NOW(),INTERVAL  13 DAY), NULL, 'EC'),
    (1003, 1,  DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  10 DAY),'SO'),
    (1004, 6,  DATE_SUB(NOW(),INTERVAL  11 DAY), NULL, 'EC'),
    (1005, 3,  DATE_SUB(NOW(),INTERVAL  10 DAY), NULL, 'EC'),
    (1006, 9,  DATE_SUB(NOW(),INTERVAL  10 DAY),NULL ,'RE'),
    (1007, 1,  DATE_SUB(NOW(),INTERVAL  3 DAY), NULL, 'EC'),
    (1008, 2,  DATE_SUB(NOW(),INTERVAL  0 DAY), NULL, 'EC');

INSERT INTO tarifs (codeTarif, libelle, prixJour) VALUES
    ('T1', 'Base', 10),
    ('T2', 'Chocolat', 15),
    ('T3', 'Bronze', 20),
    ('T4', 'Argent', 30),
    ('T5', 'Or', 50),
    ('T6', 'Platine', 90);

INSERT INTO gammes (codeGam, libelle) VALUES
    ('PR', 'Matériel Professionnel'),
    ('HG', 'Haut de gamme'),
    ('MG', 'Moyenne gamme'),
    ('EG', 'Entrée de gamme');

INSERT INTO categories (codeCate, libelle) VALUES
    ('MONO', 'Monoski'),
    ('SURF', 'Surf'),
    ('PA', 'Patinette'),
    ('FOA', 'Ski de fond alternatif'),
    ('FOP', 'Ski de fond patineur'),
    ('SA', 'Ski alpin');

INSERT INTO grilleTarifs (codeGam, codeCate, codeTarif) VALUES
    ('EG', 'MONO', 'T1'),
    ('MG', 'MONO', 'T2'),
    ('EG', 'SURF', 'T1'),
    ('MG', 'SURF', 'T2'),
    ('HG', 'SURF', 'T3'),
    ('PR', 'SURF', 'T5'),
    ('EG', 'PA', 'T1'),
    ('MG', 'PA', 'T2'),
    ('EG', 'FOA', 'T1'),
    ('MG', 'FOA', 'T2'),
    ('HG', 'FOA', 'T4'),
    ('PR', 'FOA', 'T6'),
    ('EG', 'FOP', 'T2'),
    ('MG', 'FOP', 'T3'),
    ('HG', 'FOP', 'T4'),
    ('PR', 'FOP', 'T6'),
    ('EG', 'SA', 'T1'),
    ('MG', 'SA', 'T2'),
    ('HG', 'SA', 'T4'),
    ('PR', 'SA', 'T6');

INSERT INTO articles (refart, designation, codeGam, codeCate) VALUES 
    ('F01', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F02', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F03', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F04', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F05', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F10', 'Fischer Sporty Crown', 'MG', 'FOA'),
    ('F20', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
    ('F21', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
    ('F22', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
    ('F23', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
    ('F50', 'Fischer SOSSkating VASA', 'HG', 'FOP'),
    ('F60', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('F61', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('F62', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('F63', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('F64', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('P01', 'Décathlon Allegre junior 150', 'EG', 'PA'),
    ('P10', 'Fischer mini ski patinette', 'MG', 'PA'),
    ('P11', 'Fischer mini ski patinette', 'MG', 'PA'),
    ('S01', 'Décathlon Apparition', 'EG', 'SURF'),
    ('S02', 'Décathlon Apparition', 'EG', 'SURF'),
    ('S03', 'Décathlon Apparition', 'EG', 'SURF'),
    ('A01', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A02', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A03', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A04', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A05', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A10', 'Salomon Pro Link Equipe 4S', 'PR', 'SA'),
    ('A11', 'Salomon Pro Link Equipe 4S', 'PR', 'SA'),
    ('A21', 'Salomon 3V RACE JR+L10', 'PR', 'SA');

INSERT INTO lignesFic (noFic, noLig,  refart, depart, retour) VALUES 
    (1001, 1, 'F05', DATE_SUB(NOW(),INTERVAL  15 DAY), DATE_SUB(NOW(),INTERVAL  13 DAY)),
    (1001, 2, 'F50', DATE_SUB(NOW(),INTERVAL  15 DAY), DATE_SUB(NOW(),INTERVAL  14 DAY)),
    (1001, 3, 'F60', DATE_SUB(NOW(),INTERVAL  13 DAY), DATE_SUB(NOW(),INTERVAL  13 DAY)),
    (1002, 1, 'A03', DATE_SUB(NOW(),INTERVAL  13 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY)),
    (1002, 2, 'A04', DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  7 DAY)),
    (1002, 3, 'S03', DATE_SUB(NOW(),INTERVAL  8 DAY), NULL),
    (1003, 1, 'F50', DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  10 DAY)),
    (1003, 2, 'F05', DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  10 DAY)),
    (1004, 1, 'P01', DATE_SUB(NOW(),INTERVAL  6 DAY), NULL),
    (1005, 1, 'F05', DATE_SUB(NOW(),INTERVAL  9 DAY), DATE_SUB(NOW(),INTERVAL  5 DAY)),
    (1005, 2, 'F10', DATE_SUB(NOW(),INTERVAL  4 DAY), NULL),
    (1006, 1, 'S01', DATE_SUB(NOW(),INTERVAL  10 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY)),
    (1006, 2, 'S02', DATE_SUB(NOW(),INTERVAL  10 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY)),
    (1006, 3, 'S03', DATE_SUB(NOW(),INTERVAL  10 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY)),
    (1007, 1, 'F50', DATE_SUB(NOW(),INTERVAL  3 DAY), DATE_SUB(NOW(),INTERVAL  2 DAY)),
    (1007, 3, 'F60', DATE_SUB(NOW(),INTERVAL  1 DAY), NULL),
    (1007, 2, 'F05', DATE_SUB(NOW(),INTERVAL  3 DAY), NULL),
    (1007, 4, 'S02', DATE_SUB(NOW(),INTERVAL  0 DAY), NULL),
    (1008, 1, 'S01', DATE_SUB(NOW(),INTERVAL  0 DAY), NULL);

//1️⃣ Liste des clients (toutes les informations) dont le nom commence par un D
SELECT * FROM clients
WHERE nom LIKE 'D%';

//3️⃣ Liste des fiches (n°, état) pour les clients (nom, prénom) qui habitent en Loire Atlantique (44)
SELECT fiches.noFic, fiches.etat, clients.nom, clients.prenom
FROM fiches
JOIN clients ON fiches.noCli = clients.noCli
WHERE clients.cpo LIKE '44%';

//4️⃣ Détail de la fiche n°1002
SELECT f.noFic, f.dateCrea, f.datePaiement, f.etat, 
       c.nom, c.prenom, a.refart, a.designation, l.depart, l.retour
FROM fiches f
JOIN clients c ON f.noCli = c.noCli
JOIN lignesfic l ON f.noFic = l.noFic
JOIN articles a ON l.refart = a.refart
WHERE f.noFic = 1002;

//5️⃣ Prix journalier moyen de location par gamme
SELECT g.codeGam, g.libelle, AVG(t.prixJour) AS prix_moyen_journalier
FROM grilleTarifs gt
JOIN gammes g ON gt.codeGam = g.codeGam
JOIN tarifs t ON gt.codeTarif = t.codeTarif
GROUP BY g.codeGam, g.libelle;

//6️⃣ Détail de la fiche n°1002 avec le total
SELECT noFic,nom,prenom,refart,designation,depart,retour,prixJour,montant, SUM(montant) OVER () AS Total
FROM (
SELECT fiches.noFic,nom,prenom,lignesFic.refart,designation,depart,retour,prixJour,(DATEDIFF(COALESCE(lignesFic.retour, 
NOW()), lignesFic.depart)+1) * tarifs.prixJour AS montant
FROM clients
INNER JOIN fiches ON clients.noCLi = fiches.noCli
INNER JOIN lignesFic ON fiches.noFic = lignesFic.noFic
INNER JOIN articles ON lignesFic.refart = articles.refart
INNER JOIN grilleTarifs ON articles.codeCate = grilleTarifs.codeCate
INNER JOIN tarifs ON grilleTarifs.codeTarif = tarifs.codeTarif
WHERE fiches.noFic = 1002
GROUP BY refArt
) AS t

//7️⃣ Grille des tarifs
SELECT g.libelle AS Gamme, c.libelle AS Categorie, t.libelle AS Tarif, t.prixJour
FROM grilleTarifs gt
JOIN gammes g ON gt.codeGam = g.codeGam
JOIN categories c ON gt.codeCate = c.codeCate
JOIN tarifs t ON gt.codeTarif = t.codeTarif;

// 8️⃣ Liste des locations de la catégorie SURF
SELECT f.noFic, f.dateCrea, f.datePaiement, f.etat, 
       c.nom, c.prenom, a.refart, a.designation, l.depart, l.retour, 
       t.prixJour, 
       DATEDIFF(IFNULL(l.retour, CURDATE()), l.depart) * t.prixJour AS total_par_article
FROM fiches f
JOIN clients c ON f.noCli = c.noCli
JOIN lignesfic l ON f.noFic = l.noFic
JOIN articles a ON l.refart = a.refart
JOIN grilletarifs gt ON a.codeGam = gt.codeGam AND a.codeCate = gt.codeCate
JOIN tarifs t ON gt.codeTarif = t.codeTarif
WHERE a.codeCate = 'SURF';

//9️⃣ Calcul du nombre moyen d’articles loués par fiche de location
SELECT AVG(article_count) AS moyenne_articles_par_fiche 
FROM ( SELECT f.noFic, COUNT(l.refart) AS article_count FROM fiches f 
JOIN lignesFic l ON f.noFic = l.noFic GROUP BY f.noFic ) AS sous_requete;

// 10️ Calcul du nombre de fiches de location établies pour les catégories de location Ski alpin, Surf et Patinette
SELECT c.libelle AS categorie, COUNT(DISTINCT f.noFic) AS nombre_de_fiches
FROM fiches f
JOIN lignesfic l ON f.noFic = l.noFic
JOIN articles a ON l.refart = a.refart
JOIN categories c ON a.codeCate = c.codeCate
WHERE c.libelle IN ('Ski alpin', 'Surf', 'Patinette')
GROUP BY c.libelle;
