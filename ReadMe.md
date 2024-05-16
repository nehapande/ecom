How to take database backup
1. Connect to pg
2. ! pg_dump ecom > ecom.sql;

How to restore the db 
1. Connect to pg
2. create database 
3. Replay the sql \i <sql_file> e.g \i /Users/prosenjit.sengupta/Documents/ecom.sql
4. check tables \d public.cart

To DO 
1. Create user/roles in ecom.sql