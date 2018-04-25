--------------------------------------------------------
-- Archivo creado  - miércoles-abril-25-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE "EJERCICIO"."CUSTOMERS" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(255), 
	"CONTRY" VARCHAR2(255), 
	"GRADE" NUMBER, 
	"SALESMAN_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "EJERCICIO"."ORDERS" 
   (	"ID" NUMBER, 
	"AMOUNT" NUMBER, 
	"ORDER_DATE" DATE, 
	"CUSTOMER_ID" NUMBER, 
	"SALESMAN_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALESMAN
--------------------------------------------------------

  CREATE TABLE "EJERCICIO"."SALESMAN" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(255), 
	"CONTRY" VARCHAR2(255), 
	"COMMISSION" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for View VIEW_1
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIO"."VIEW_1" ("SALESMAN_ID", "SALESMAN_NAME", "CUSTOMERS_ID", "CUSTOMERS_NAME") AS 
  SELECT SALESMAN.ID AS SALESMAN_ID ,SALESMAN.NAME AS SALESMAN_NAME ,CUSTOMERS.ID AS CUSTOMERS_ID,CUSTOMERS.NAME AS CUSTOMERS_NAME 
    
FROM CUSTOMERS INNER JOIN SALESMAN ON SALESMAN.ID = CUSTOMERS.SALESMAN_ID
;
--------------------------------------------------------
--  DDL for View VIEW_2
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIO"."VIEW_2" ("ORDERS_ID", "ORDERS_ORDER_DATE", "ORDERS_AMOUNT", "CUSTOMERS_ID", "CUSTOMERS_NAME", "SALESMAN_ID", "SALESMAN_NAME", "SALESMAN_COMMISSION") AS 
  SELECT ORDERS.ID AS ORDERS_ID, ORDERS.ORDER_DATE AS ORDERS_ORDER_DATE, ORDERS.AMOUNT AS ORDERS_AMOUNT,
       CUSTOMERS.ID AS CUSTOMERS_ID,CUSTOMERS.NAME AS CUSTOMERS_NAME , SALESMAN.ID AS SALESMAN_ID, SALESMAN.NAME AS SALESMAN_NAME,
       SALESMAN.COMMISSION AS SALESMAN_COMMISSION
       
    
FROM ORDERS INNER JOIN CUSTOMERS ON ORDERS.CUSTOMER_ID = CUSTOMERS.ID INNER JOIN SALESMAN ON ORDERS.SALESMAN_ID = SALESMAN.ID
;
--------------------------------------------------------
--  DDL for View VIEW_3
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIO"."VIEW_3" ("CUSTOMERS_ID", "CUSTOMERS_NAME", "SALESMAN_ID", "SALESMAN_NAME") AS 
  SELECT CUSTOMERS.ID AS CUSTOMERS_ID, CUSTOMERS.NAME AS CUSTOMERS_NAME, SALESMAN.ID AS SALESMAN_ID,
       SALESMAN.NAME AS SALESMAN_NAME
    
FROM CUSTOMERS LEFT OUTER JOIN SALESMAN ON CUSTOMERS.SALESMAN_ID= SALESMAN.ID

WHERE (CUSTOMERS.GRADE <300) AND (SALESMAN.ID IS NULL) OR (SALESMAN.ID IS NOT NULL)

ORDER BY CUSTOMERS.GRADE ASC
;
--------------------------------------------------------
--  DDL for Index CUSTOMERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIO"."CUSTOMERS_PK" ON "EJERCICIO"."CUSTOMERS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ORDERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIO"."ORDERS_PK" ON "EJERCICIO"."ORDERS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALESMAN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIO"."SALESMAN_PK" ON "EJERCICIO"."SALESMAN" ("ID") 
  ;
--------------------------------------------------------
--  Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIO"."CUSTOMERS" ADD CONSTRAINT "CUSTOMERS_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "EJERCICIO"."CUSTOMERS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIO"."ORDERS" ADD CONSTRAINT "ORDERS_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "EJERCICIO"."ORDERS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SALESMAN
--------------------------------------------------------

  ALTER TABLE "EJERCICIO"."SALESMAN" ADD CONSTRAINT "SALESMAN_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "EJERCICIO"."SALESMAN" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIO"."CUSTOMERS" ADD CONSTRAINT "FORANEA2" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "EJERCICIO"."SALESMAN" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIO"."ORDERS" ADD CONSTRAINT "FORANEA" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "EJERCICIO"."SALESMAN" ("ID") ENABLE;
  ALTER TABLE "EJERCICIO"."ORDERS" ADD CONSTRAINT "FORANEA1" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "EJERCICIO"."CUSTOMERS" ("ID") ENABLE;
