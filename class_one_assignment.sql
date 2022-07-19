CREATE DATABASE class_one_assignment;

USE class_one_assignment;

CREATE TABLE customers(
id INT AUTO_INCREMENT,
customer_frist_name VARCHAR(50) NOT NULL,
customer_last_name VARCHAR(50) NOT NULL,
customer_date_of_birth DATE NOT NULL,
customer_phone INT(15) NOT NULL,
customer_address VARCHAR(50) NOT NULL,
customer_city VARCHAR(50) NOT NULL,
customer_state VARCHAR(50) NOT NULL,
customer_points INT(50) NOT NULL,
PRIMARY KEY (id)
);

SELECT * FROM customers;

/*insert customer data*/
INSERT INTO customers(customer_frist_name, customer_last_name, customer_date_of_birth, customer_phone, customer_address, customer_city, customer_state, customer_points) VALUES
('Babara', 'MacCaffrey', '1986-03-28', '781-932-9754', '0 Sage Terrace', 'Waltham', 'MA', '2273'),
('Ines', 'Brushfield', '1986-04-13', '804-427-9456', '14187 Commercial Trail', 'Hampton', 'VA', '947'),
('Freddi', 'Boagey', '1985-02-07', '719-724-7869', '251 Springs Junction', 'Colorado Springs', 'CO', '2967'),
('Ambur', 'Roseburgh', '1974-04-14', '407-231-8017', '30 Arapahoe Terrace', 'Orlando', 'FL', '457'),
('Clemmie', 'Betchley', '1973-11-07', '', '5 Spohn Circle', 'Arlington', 'TX', '3675')
;

/*Show only 2 members whose points are more than 1000.*/
SELECT * FROM customers GROUP BY customer_date_of_birth HAVING customer_points>=1000&& customer_points<=3000;

/*Find the customers whose age is in 1980 to 1990 or points less than 1000.*/
SELECT * FROM customers WHERE customer_date_of_birth BETWEEN '1980-01-01' AND '1990-12-31' AND customer_points>=1000;

/*Order the customers by points in ascending order*/
SELECT * FROM customers ORDER BY customer_points ASC;

/*Order the customers by points in descending order*/
SELECT * FROM customers ORDER BY customer_points DESC;

/*Find the customer using Like*/
SELECT * FROM customers WHERE customer_last_name LIKE '%burgh';

/*Find the customer using regexp*/
SELECT * FROM customers WHERE customer_last_name REGEXP 'burgh';

/*Find the customer who does not have phone number*/
SELECT * FROM customers WHERE customer_phone='0';

/*update column*/
ALTER TABLE customers CHANGE customer_date_of_birth customer_dob VARCHAR(50);

/*Find Max Points holder*/
SELECT customer_frist_name, customer_last_name, customer_dob, customer_phone, customer_address, customer_city, customer_state, MAX(customer_points ) FROM customers WHERE customer_points  IN (SELECT MAX(customer_points ) FROM customers);

/*case scenario*/
SELECT *, CASE
     WHEN customer_points<1000 THEN 'they are bronze member'
     WHEN customer_points>1000 && customer_points<2000 THEN 'they are silver member'
     WHEN customer_points>2000 && customer_points<3000 THEN 'they are gold member'
     ELSE 'they are platinum member'
     END AS test FROM customers;
     

/*drop table
Drop table customers;*/

/*table data remove
Truncate table customers;