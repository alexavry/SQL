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