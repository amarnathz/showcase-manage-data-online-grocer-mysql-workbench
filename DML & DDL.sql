-- create database online_grocer;

-- create schema grocer_schema


create Table if not exist customer ( 
cust_id INT NOT NULL ,	
cust_name varchar(50) Not NULL ,

Primary Key( cust_id )	
	); 

	
Insert into customer values( 198765 ,   'Ram' ) ,
  ( 202900 ,   'Vick' ) ,
  ( 196777 ,   'Rahul' ) ,
  ( 277177 ,   'prethi' ) ,
  ( 111000 ,   'Surya' ) ,
  ( 100988 ,   'sumaya' ) ;

create Table items ( 
item_id	INT NOT NULL , 
description varchar(500) Not NULL ,
vendor  varchar(500) Not NULL ,	 
quantity_onhand INT NOT NULL , 
item_type varchar(50) Not NULL 	,
location  varchar(10) Not NULL ,
cost float4 not null , 
unit varchar(50) Not NULL 	,
purchase_date	Date Not NULL  ,	
	
Primary Key( item_id )	
); 


Insert into items values ( 1000 ,   'Bennet Farm free-range eggs' , 'Bennet Farms, Rt. 17 Evansville, IL 55446' , 102  ,   'Dairy'  ,  'D12'  ,  2.35  , 'dozen'  , '2/1/2022' ) , 
 ( 2000 ,   'Rubys Kale' , 'Ruby Redd Produce, LLC, 1212 Milam St., Kenosha, AL, 34567' , 57  ,   'Produce'  ,  'p12'  ,  1.29  , 'bunch'  ,  '2/12/2022' ), 
 ( 1100 ,   'Freshness White beans' , 'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678' , 152  ,   'Canned'  ,  'a2'  ,  0.69  , '12 ounce can'  ,'2/2/2022' ), 
 ( 1222 ,   'Freshness Green beans' , 'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678' , 106  ,   'Canned'  ,  'a3'  ,  0.59  , '12 ounce can'  , '2/10/2022' ), 
 ( 1223 ,   'Freshness Green beans' , 'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678' , 36  ,   'Canned'  ,  'a7'  ,  1.75  , '36 oz can'  ,  '2/10/2022' ), 
 ( 1224 ,   'Freshness Wax beans' , 'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678' , 54  ,   'Canned'  ,  'a3'  ,  0.65  , '12 ounce can'  ,  '2/10/2022' ), 
 ( 2001 ,   'Rubys Organic Kale' , 'Ruby Redd Produce, LLC, 1212 Milam St., Kenosha, AL, 34567' , 46  ,   'Produce'  ,  'po2'  ,  2.19  , 'bunch'  ,  '2/12/2022' )
 ;
	

create Table order_details (
qty INT NOT NULL , 
price   float4 NOT NULL , 
date_sold Date Not NULL  ,	
cust_id	INT NOT NULL , 
item_id INT NOT NULL ,

FOREIGN KEY (cust_id)
   REFERENCES customer (cust_id),
FOREIGN KEY (item_id)
   REFERENCES items (item_id)
	);

Insert into order_details values( 27 ,   5.49 , '2/2/2022' , 198765 , 1000 ) ,
( 2 ,   3.99 , '2/2/2022' , 202900 , 2000 ) ,
( 2 ,   1.49 , '2/2/2022' , 202900 , 1100 ) ,
( 40 ,   5.99 , '2/4/2022' , 196777 , 1100 ) ,
( 2 ,   5.99 , '2/4/2022' , 196777 , 1000 ) ,
( 8 ,   1.49 , '2/7/2022' , 198765 , 1100 ) ,
( 40 ,   5.49 , '2/8/2022' , 277177 , 1222 ) ,
( 10 ,   5.49 , '2/9/2022' , 277177 , 1223 ) ,
( 30 ,   5.49 , '2/10/2022' , 277177 , 1224 ) ,
( 4 ,   5.49 , '2/11/2022' , 277177 , 1000 ) ,
( 4 ,   1.49 , '2/11/2022' , 111000 , 1100 ) ,
( 12 ,   1.29 , '2/12/2022' , 111000 , 1222 ) ,
( 8 ,   1.55 , '2/12/2022' , 198765 , 1224 ) ,
( 25 ,   3.49 , '2/13/2022' , 198765 , 2000 ) ,
( 20 ,   3.49 , '2/13/2022' , 198765 , 2001 ) ,
( 5 ,   3.49 , '2/13/2022' , 198765 , 1223 ) ,
( 1 ,   6.99 , '2/13/2022' , 100988 , 2001 ) ,
( 12 ,   6.99 , '2/14/2022' , 202900 , 2001 ) ,
( 10 ,   3.99 , '2/15/2022' , 111000 , 1223 ) ,
( 2 ,   3.99 , '2/15/2022' , 111000 , 2000 ) ;



-- Testing SQL script 


SELECT c.cust_id, c.cust_name ,
o.qty	, o.price ,	o.date_sold  ,
i.description ,i.vendor ,	 i.quantity_onhand , i.item_type 	,i.location   ,i.cost  , i.unit 	,i.purchase_date 
	
FROM customer c inner join order_details o
on c.cust_id = o.cust_id 
inner join items i 
on o.item_id = i.item_id
where c.cust_id  = 198765
;

