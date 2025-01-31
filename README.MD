Bien sûr ! Voici une cheat sheet complète pour les bases du SQL :

---

# SQL Cheat Sheet

## 1. Introduction

SQL (Structured Query Language) est un langage standardisé pour gérer et manipuler des bases de données relationnelles.

## 2. Commandes de Base

### SELECT

Récupère des données d'une base de données.

```sql
SELECT column1, column2 FROM table_name;
```

### INSERT

Ajoute de nouvelles lignes dans une table.

```sql
INSERT INTO table_name (column1, column2) VALUES (value1, value2);
```

### UPDATE

Modifie des données existantes dans une table.

```sql
UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;
```

### DELETE

Supprime des lignes d'une table.

```sql
DELETE FROM table_name WHERE condition;
```

### CREATE TABLE

Crée une nouvelle table.

```sql
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
);
```

### DROP TABLE

Supprime une table existante.

```sql
DROP TABLE table_name;
```

### ALTER TABLE

Modifie une table existante.

```sql
ALTER TABLE table_name ADD column_name datatype;
ALTER TABLE table_name DROP COLUMN column_name;
ALTER TABLE table_name MODIFY COLUMN column_name datatype;
```

## 3. Filtres et Conditions

### WHERE

Filtre les enregistrements.

```sql
SELECT column1, column2 FROM table_name WHERE condition;
```

### AND / OR

Combine plusieurs conditions.

```sql
SELECT column1, column2 FROM table_name WHERE condition1 AND condition2;
SELECT column1, column2 FROM table_name WHERE condition1 OR condition2;
```

### IN

Permet de spécifier plusieurs valeurs dans une clause WHERE.

```sql
SELECT column1, column2 FROM table_name WHERE column_name IN (value1, value2, value3);
```

### BETWEEN

Sélectionne des valeurs dans une plage donnée.

```sql
SELECT column1, column2 FROM table_name WHERE column_name BETWEEN value1 AND value2;
```

### LIKE

Recherche un motif spécifique dans une colonne.

```sql
SELECT column1, column2 FROM table_name WHERE column_name LIKE pattern;
```

### IS NULL / IS NOT NULL

Filtre les valeurs NULL.

```sql
SELECT column1, column2 FROM table_name WHERE column_name IS NULL;
SELECT column1, column2 FROM table_name WHERE column_name IS NOT NULL;
```

## 4. Fonctions Agrégées

### COUNT

Compte le nombre de lignes.

```sql
SELECT COUNT(column_name) FROM table_name;
```

### SUM

Calcule la somme des valeurs d'une colonne numérique.

```sql
SELECT SUM(column_name) FROM table_name;
```

### AVG

Calcule la moyenne des valeurs d'une colonne numérique.

```sql
SELECT AVG(column_name) FROM table_name;
```

### MAX

Renvoie la valeur maximale d'une colonne.

```sql
SELECT MAX(column_name) FROM table_name;
```

### MIN

Renvoie la valeur minimale d'une colonne.

```sql
SELECT MIN(column_name) FROM table_name;
```

## 5. Jointures

### INNER JOIN

Renvoie les enregistrements ayant des valeurs correspondantes dans les deux tables.

```sql
SELECT columns FROM table1 INNER JOIN table2 ON table1.common_field = table2.common_field;
```

### LEFT JOIN

Renvoie tous les enregistrements de la table de gauche et les enregistrements correspondants de la table de droite.

```sql
SELECT columns FROM table1 LEFT JOIN table2 ON table1.common_field = table2.common_field;
```

### RIGHT JOIN

Renvoie tous les enregistrements de la table de droite et les enregistrements correspondants de la table de gauche.

```sql
SELECT columns FROM table1 RIGHT JOIN table2 ON table1.common_field = table2.common_field;
```

### FULL JOIN

Renvoie tous les enregistrements lorsqu'il y a une correspondance dans l'une des tables.

```sql
SELECT columns FROM table1 FULL JOIN table2 ON table1.common_field = table2.common_field;
```

## 6. Sous-requêtes

### Sous-requête dans SELECT

```sql
SELECT column1, (SELECT column2 FROM table2 WHERE condition) AS alias FROM table1;
```

### Sous-requête dans WHERE

```sql
SELECT column1, column2 FROM table1 WHERE column1 = (SELECT column2 FROM table2 WHERE condition);
```

### Sous-requête dans FROM

```sql
SELECT column1, column2 FROM (SELECT column1, column2 FROM table2 WHERE condition) AS alias;
```

## 7. Index

### Créer un index

```sql
CREATE INDEX index_name ON table_name (column_name);
```

### Supprimer un index

```sql
DROP INDEX index_name ON table_name;
```

## 8. Vues

### Créer une vue

```sql
CREATE VIEW view_name AS SELECT column1, column2 FROM table_name WHERE condition;
```

### Supprimer une vue

```sql
DROP VIEW view_name;
```

## 9. Transactions

### Démarrer une transaction

```sql
BEGIN TRANSACTION;
```

### Valider une transaction

```sql
COMMIT;
```

### Annuler une transaction

```sql
ROLLBACK;
```

## 10. Contraintes

### NOT NULL

Assure qu'une colonne ne peut pas avoir de valeur NULL.

```sql
CREATE TABLE table_name (column_name datatype NOT NULL);
```

### UNIQUE

Assure que toutes les valeurs dans une colonne sont différentes.

```sql
CREATE TABLE table_name (column_name datatype UNIQUE);
```

### PRIMARY KEY

Combinaison de NOT NULL et UNIQUE.

```sql
CREATE TABLE table_name (column_name datatype PRIMARY KEY);
```

### FOREIGN KEY

Assure l'intégrité référentielle pour une colonne.

```sql
CREATE TABLE table_name (
    column_name datatype,
    FOREIGN KEY (column_name) REFERENCES table2(column_name)
);
```

### CHECK

Assure que toutes les valeurs dans une colonne satisfont une condition.

```sql
CREATE TABLE table_name (column_name datatype CHECK (column_name > value));
```

### DEFAULT

Définit une valeur par défaut pour une colonne.

```sql
CREATE TABLE table_name (column_name datatype DEFAULT value);
```

---

Cette cheat sheet couvre les bases du SQL et devrait vous aider à démarrer avec les requêtes SQL les plus courantes. Si vous avez des questions ou besoin de plus d'informations, n'hésitez pas à demander !