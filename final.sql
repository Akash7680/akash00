create table CLIENT_MASTER (CLIENTNO varchar(6) primary key,NAME varchar(30),CITY varchar(10),PINCODE int,STATE varchar(15),BALDUE int,CONSTRAINT CK_CLIENTNO CHECK(CLIENTNO LIKE 'C%'),CONSTRAINT CK_PINCODE CHECK(PINCODE <=999999));

insert into CLIENT_MASTER values('C00001','IVAN_BAYROSS','MUMBAI',400005,'MAHARASHTRA',15000) ;
insert into CLIENT_MASTER values('C00002','MAMTAMUZUMDAR','MADRAS',780001,'TAMILNADU',0) ;
insert into CLIENT_MASTER values('C00003','CHHAYA_BANKAR','MUMBAI',400057,'MAHARASHTRA',5000) ;
insert into CLIENT_MASTER values('C00004','ASHWINI_JOSHI','BANGALORE',560001,'KARNATAKA',0) ;
insert into CLIENT_MASTER values('C00005','HANSEL_COLACO','MUMBAI',400060,'MAHARASHTRA',2000) ;
insert into CLIENT_MASTER values('C00006','DEEPAK_SHARMA','BANGALORE',560050,'KARNATAKA',0) ;


CREATE table PRODUCT_MASTER (PRODUCTNO varchar(6) not null primary key,DESCRIPTION varchar(15),PROFITPERCENT int,UNITMEASURE varchar(10),QTYONHAND int,REORDERLVL int,SELLPRICE int,COSTPRICE int,CONSTRAINT CK_PRODUCTNO CHECK(PRODUCTNO LIKE 'P%'),CONSTRAINT CK_UNITMEASURE CHECK(UNITMEASURE IN('PEICE')),CONSTRAINT CK_COST CHECK(COSTPRICE <>0),CONSTRAINT CK_SELLPRICE CHECK(SELLPRICE <>0));

insert into PRODUCT_MASTER values ('P00001','T-SHIRT',5,'PEICE',200,50,350,250);
insert into PRODUCT_MASTER values ('P0345','SHIRT',6,'PEICE',150,50,500,350);
insert into PRODUCT_MASTER values ('P06734','COTTON JEANS',5,'PEICE',100,20,600,450);
insert into PRODUCT_MASTER values ('P07865','JEANS',5,'PEICE',100,20,750,500);
insert into PRODUCT_MASTER values ('P07868','TROSURES',2,'PEICE',150,50,850,550);
insert into PRODUCT_MASTER values ('P07885','PULL-OVRS',2.5,'PEICE',80,30,700,450);
insert into PRODUCT_MASTER values ('P07965','DENIM SHIRT',4,'PEICE',100,40,350,250);
insert into PRODUCT_MASTER values ('P07975','LYCRA TOP',5,'PEICE',70,30,300,175);
insert into PRODUCT_MASTER values ('P08865','SKIRT',5,'PEICE',75,30,450,300);




create table SALESMAN_MASTER (SALESMANNO varchar(20) not null primary key,FNAME varchar(10) not null ,ADDRESS1 varchar(10),ADDRESS2 varchar(10),CITY varchar(10),PINCODE int,STATE varchar(20),CONSTRAINT CK_SALESMANNO(SALESMANNO LIKE 'S%'));

insert into SALESMAN_MASTER values('S00001','AMAN','A-14','WORLI','MUMBAI',400002,'MAHARASHTRA');
insert into SALESMAN_MASTER values('S00002','OMKAR',65,'NARIMAN','MUMBAI',400001,'MAHARASHTRA');
insert into SALESMAN_MASTER values('S00003','RAJ','p-7','BANDRA','MUMBAI',400032,'MAHARASHTRA');
insert into SALESMAN_MASTER values('S00004','ASHISH','a-5','JUHU','MUMBAI',400044,'MAHARASHTRA');
insert into SALESMAN_MASTER values('S00005','RADHE','a-5','JUHU','MUMBAI',400033,'MAHARASHTRA');


create table SALES_ORDER (ORDERNO varchar(10) not null primary key,CLIENTNO varchar(6) references CLIENT_MASTER, ORDERDATE date not null,SALESMANNO varchar(20) references SALESMAN_MASTER,CONSTRAINT CK_ORDERNO CHECK(ORDERNO LIKE 'O%'));

insert into SALES_ORDER values('O19001','C00001','12-JUNE-04','S00001');
insert into SALES_ORDER values('O19002','C00002','25-JUNE-04','S00002');
insert into SALES_ORDER values('O19003','C00003','18-FEB-04','S00003');
insert into SALES_ORDER values('O19004','C00004','03-APR-04','S00004');
insert into SALES_ORDER values('O19005','C00005','03-APR-04','S00005');

create table SALES_ORDER_DETAILS (ORDERNO varchar(10)  references SALES_ORDER ,PRODUCTNO varchar(6) references PRODUCT_MASTER ,QTYORDERED int not null,QTYDISP int not null,PRODUCTRATE int not null,CONSTRAINT CK_QTYORDERED CHECK(QTYORDERED <>0),CONSTRAINT CK_PRODUCTRATE CHECK(PRODUCTRATE <>0));

insert into SALES_ORDER_DETAILS values('O19001','P00001',4,4,525);
insert into SALES_ORDER_DETAILS values('O19002','P0345',2,1,8400);
insert into SALES_ORDER_DETAILS values('O19003','P06734',2,1,5250);
insert into SALES_ORDER_DETAILS values('O19004','P07865',10,0,525);
insert into SALES_ORDER_DETAILS values('O19005','P07868',10,0,525);


-- INNER JOIN ----------

    -- SELECT SALES_ORDER.ORDERNO,SALES_ORDER_DETAILS.QTYDISP,SALES_ORDER_DETAILS.QTYORDERED
    -- FROM SALES_ORDER
    -- INNER JOIN SALES_ORDER_DETAILS
    -- ON SALES_ORDER.ORDERNO = SALES_ORDER_DETAILS.ORDERNO

-- SELECT SALES_ORDER.SALESMANNO,SALESMAN_MASTER.ADDRESS1,SALESMAN_MASTER.ADDRESS2,SALESMAN_MASTER.CITY
-- FROM SALES_ORDER
-- INNER JOIN SALESMAN_MASTER
-- ON SALES_ORDER.SALESMANNO = SALESMAN_MASTER.SALESMANNO

-- ----------------------------------------------------------------------------

select * from CLIENT_MASTER 
--where CITY='mumbai' and baldue = 0
--where city in('mumbai','madras')
--where city not in('mumbai','madras')
--where BALDUE between 2000 and 5000
--where name like '%col%'

QUERY SOLUTION FROM NODE _GROUP 1 SCREENSHOTS:
--A query:
--2nd character 'a';
--where NAME like '_a%';

--B query:
--stay in city whose first character start from 'M'
--where CITY like 'm%'

--C query:
--client who stay in 'bangalore' or 'mangalore'
--where city like 'BANGALORE' or CITY = 'MANGALORE'

--D query:
--clients whose baldue greater than 10000
--where BALDUE>10000

--F query:
--client number 'c00001' and 'c00002'
--where CLIENTNO in('c00001','c00002')

--I query:
--clients name,city,state1 who are not in state maharashtra 
--SELECT NAME,CITY,STATE1 FROM CLIENT_MASTER WHERE STATE1 NOT IN ('maharashtra')




-- DATE:-12-1-2022 [INNER JOIN QUERY SOLVE]


-- --------------------------------------------------------------------------------------------------------------------------------------------------
--a. Find out the products, which have been sold to 'Ivan Bayross'.  
-- --------------------------------------------------------------------------------------------------------------------------------------------------
    

--SELECT CLIENT_MASTER.CLIENTNO,CLIENT_MASTER.NAME,SALES_ORDER.ORDERNO,SALES_ORDER_DETAILS.PRODUCTNO,PRODUCT_MASTER.DESCRIPTION1,PRODUCT_MASTER.COSTPRICE,PRODUCT_MASTER.PROFITPERCENT,PRODUCT_MASTER.UNITMEASURE,PRODUCT_MASTER.QTYONHAND,PRODUCT_MASTER.REORDERLVL,PRODUCT_MASTER.SELLPRICE,PRODUCT_MASTER.COSTPRICE
--FROM CLIENT_MASTER
--INNER JOIN SALES_ORDER ON SALES_ORDER.CLIENTNO = CLIENT_MASTER.CLIENTNO
--INNER JOIN SALES_ORDER_DETAILS ON SALES_ORDER_DETAILS.ORDERNO = SALES_ORDER.ORDERNO
--INNER JOIN PRODUCT_MASTER ON PRODUCT_MASTER.PRODUCTNO = SALES_ORDER_DETAILS.PRODUCTNO
--WHERE NAME = 'IVAN_BAYROSS';
-- --------------------------------------------------------------------------------------------------------------------------------------------------



-- --------------------------------------------------------------------------------------------------------------------------------------------------
--c. List the ProductNo and description of constantly sold (i.e. rapidly moving) products.
-- --------------------------------------------------------------------------------------------------------------------------------------------------


--SELECT PRODUCT_MASTER.PRODUCTNO,PRODUCT_MASTER.DESCRIPTION1,SALES_ORDER_DETAILS.QTYORDERED
--FROM PRODUCT_MASTER
--INNER JOIN SALES_ORDER_DETAILS ON SALES_ORDER_DETAILS.PRODUCTNO = PRODUCT_MASTER.PRODUCTNO
--WHERE  QTYORDERED = (
--		SELECT 
--			MAX(SALES_ORDER_DETAILS.QTYORDERED)
--		FROM
--			SALES_ORDER_DETAILS)
-- --------------------------------------------------------------------------------------------------------------------------------------------------



-- --------------------------------------------------------------------------------------------------------------------------------------------------
--d. Find the names of clients who have purchased Trousers'.
-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- SELECT CLIENT_MASTER.CLIENTNO,SALES_ORDER.ORDERNO,SALES_ORDER_DETAILS.PRODUCTNO,CLIENT_MASTER.NAME,PRODUCT_MASTER.DESCRIPTION1
-- FROM CLIENT_MASTER
-- INNER JOIN SALES_ORDER ON SALES_ORDER.CLIENTNO = CLIENT_MASTER.CLIENTNO
-- INNER JOIN SALES_ORDER_DETAILS ON SALES_ORDER_DETAILS.ORDERNO = SALES_ORDER.ORDERNO
-- INNER JOIN PRODUCT_MASTER ON PRODUCT_MASTER.PRODUCTNO = SALES_ORDER_DETAILS.PRODUCTNO
-- WHERE DESCRIPTION1 = 'TROSURES'
-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- --------------------------------------------------------------------------------------------------------------------------------------------------
--e. List the products and orders from customers who have ordered less than 5 units of 'Pull Overs'
-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- SELECT PRODUCT_MASTER.PRODUCTNO,PRODUCT_MASTER.DESCRIPTION1,SALES_ORDER_DETAILS.QTYORDERED
-- FROM SALES_ORDER_DETAILS
-- INNER JOIN PRODUCT_MASTER ON PRODUCT_MASTER.PRODUCTNO = SALES_ORDER_DETAILS.PRODUCTNO
-- WHERE QTYORDERED<5
-- --------------------------------------------------------------------------------------------------------------------------------------------------



-- --------------------------------------------------------------------------------------------------------------------------------------------------
--f. Find the products and their quantities for the orders placed by 'Ivan Bayross' and 'Mamta Muzumdar'.
-- --------------------------------------------------------------------------------------------------------------------------------------------------

-- SELECT CLIENT_MASTER.NAME ,PRODUCT_MASTER.DESCRIPTION1,SALES_ORDER_DETAILS.QTYORDERED
-- FROM PRODUCT_MASTER
-- INNER JOIN SALES_ORDER_DETAILS ON SALES_ORDER_DETAILS.PRODUCTNO = PRODUCT_MASTER.PRODUCTNO
-- INNER JOIN SALES_ORDER ON SALES_ORDER.ORDERNO = SALES_ORDER_DETAILS.ORDERNO
-- INNER JOIN CLIENT_MASTER ON CLIENT_MASTER.CLIENTNO = SALES_ORDER.CLIENTNO
-- WHERE NAME IN('IVAN_BAYROSS','MAMTAMUZUMDAR')
-- --------------------------------------------------------------------------------------------------------------------------------------------------



-- --------------------------------------------------------------------------------------------------------------------------------------------------
--g. Find the products and their quantities for the orders placed by ClientNo C00001' and C00002'.
-- --------------------------------------------------------------------------------------------------------------------------------------------------

-- SELECT CLIENT_MASTER.CLIENTNO,CLIENT_MASTER.NAME , PRODUCT_MASTER.DESCRIPTION1,SALES_ORDER_DETAILS.QTYORDERED
--  FROM PRODUCT_MASTER
--  INNER JOIN SALES_ORDER_DETAILS ON SALES_ORDER_DETAILS.PRODUCTNO = PRODUCT_MASTER.PRODUCTNO
--  INNER JOIN SALES_ORDER ON SALES_ORDER.ORDERNO = SALES_ORDER_DETAILS.ORDERNO
--  INNER JOIN CLIENT_MASTER ON CLIENT_MASTER.CLIENTNO = SALES_ORDER.CLIENTNO
--  WHERE CLIENT_MASTER.CLIENTNO IN('C00001','C00002')


-- --------------------------------------------------------------------------------------------------------------------------------------------------


                                                ::DATE FUNCTION::

------------------------- GETDATE() -----------------------------	 

SELECT GETDATE();

------------------------- SYSDATETIME() -----------------------------	 

SELECT SYSDATETIME();



------------------------- DATENAME() -----------------------------	

-- DECLARE @dt DATETIME2= '2020-10-02 10:20:30.1234567 +08:10';

-- SELECT 'year,yyy,yy' date_part, 
--     DATENAME(year, @dt) result
-- UNION
-- SELECT 'quarter, qq, q', 
--     DATENAME(quarter, @dt)
-- UNION
-- SELECT 'month, mm, m', 
--     DATENAME(month, @dt)
-- UNION
-- SELECT 'dayofyear, dy, y', 
--     DATENAME(dayofyear, @dt)
-- UNION
-- SELECT 'day, dd, d', 
--     DATENAME(day, @dt)
-- UNION
-- SELECT 'week, wk, ww', 
--     DATENAME(week, @dt)
-- UNION
-- SELECT 'weekday, dw, w', 
--     DATENAME(weekday, @dt)
-- UNION
-- SELECT 'hour, hh' date_part, 
--     DATENAME(hour, @dt)
-- UNION
-- SELECT 'minute, mi,n', 
--     DATENAME(minute, @dt)
-- UNION
-- SELECT 'second, ss, s', 
--     DATENAME(second, @dt)
-- UNION
-- SELECT 'millisecond, ms', 
--     DATENAME(millisecond, @dt)
-- UNION
-- SELECT 'microsecond, mcs', 
--     DATENAME(microsecond, @dt)
-- UNION
-- SELECT 'nanosecond, ns', 
--     DATENAME(nanosecond, @dt)
-- UNION
-- SELECT 'TZoffset, tz', 
--     DATENAME(tz, @dt)
-- UNION
-- SELECT 'ISO_WEEK, ISOWK, ISOWW', 
--     DATENAME(ISO_WEEK, @dt);


------------------------- DATEPART() -----------------------------	

-- DECLARE @dt DATETIME2= '2020-10-02 10:20:30.1234567 +08:10';

-- SELECT 'year,yyy,yy' date_part, 
--     DATENAME(year, @dt) result
-- UNION
-- SELECT 'quarter, qq, q', 
--     DATENAME(quarter, @dt)
-- UNION
-- SELECT 'month, mm, m', 
--     DATENAME(month, @dt)
-- UNION
-- SELECT 'dayofyear, dy, y', 
--     DATENAME(dayofyear, @dt)
-- UNION
-- SELECT 'day, dd, d', 
--     DATENAME(day, @dt)
-- UNION
-- SELECT 'week, wk, ww', 
--     DATENAME(week, @dt)
-- UNION
-- SELECT 'weekday, dw, w', 
--     DATENAME(weekday, @dt)
-- UNION
-- SELECT 'hour, hh' date_part, 
--     DATENAME(hour, @dt)
-- UNION
-- SELECT 'minute, mi,n', 
--     DATENAME(minute, @dt)
-- UNION
-- SELECT 'second, ss, s', 
--     DATENAME(second, @dt)
-- UNION
-- SELECT 'millisecond, ms', 
--     DATENAME(millisecond, @dt)
-- UNION
-- SELECT 'microsecond, mcs', 
--     DATENAME(microsecond, @dt)
-- UNION
-- SELECT 'nanosecond, ns', 
--     DATENAME(nanosecond, @dt)
-- UNION
-- SELECT 'TZoffset, tz', 
--     DATENAME(tz, @dt)
-- UNION
-- SELECT 'ISO_WEEK, ISOWK, ISOWW', 
--     DATENAME(ISO_WEEK, @dt);


--NOTE--
   The DATENAME() function returns the date part as a character string whereas the DATEPART() returns the date part as an integer.






------------------------- DATEDIFF() -----------------------------

-- DECLARE 
--     @start_dt DATETIME2= '2003-09-15 23:59:59.9999999', 
--     @end_dt DATETIME2= GETDATE();

-- SELECT 
--     DATEDIFF(year, @start_dt, @end_dt) diff_in_year, 
--     DATEDIFF(quarter, @start_dt, @end_dt) diff_in_quarter, 
--     DATEDIFF(month, @start_dt, @end_dt) diff_in_month, 
--     DATEDIFF(dayofyear, @start_dt, @end_dt) diff_in_dayofyear, 
--     DATEDIFF(day, @start_dt, @end_dt) diff_in_day, 
--     DATEDIFF(week, @start_dt, @end_dt) diff_in_week, 
--     DATEDIFF(hour, @start_dt, @end_dt) diff_in_hour, 
--     DATEDIFF(minute, @start_dt, @end_dt) diff_in_minute, 
--     DATEDIFF(second, @start_dt, @end_dt) diff_in_second;
--     --DATEDIFF(millisecond, @start_dt, @end_dt) diff_in_millisecond;


--  DATE:-19-1-2022//

 ----------------------  G R O U P    B Y  --------------------------------------

select * from CLIENT_MASTER

SELECT COUNT(CLIENTNO) CLIENT,STATE1
FROM CLIENT_MASTER
GROUP BY STATE1



