--Databases stored in the metastore can be shown with this command
SHOW DATABASES;

--Selecting a database
USE default;

--Listing all tables in a database
SHOW TABLES;

--Looking at the structure of a table
DESCRIBE hivesampletable;

--Let's do some real work
--Create a new database called weather to use for the rest of the demo
CREATE DATABASE IF NOT EXISTS weather;

--Switch context over to new weather database
USE weather;

