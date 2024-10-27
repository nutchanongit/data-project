/*
    create at least 3 tables: restaurant
    - transactions
    - staff
    - menu 
    - ingredient
    - ...
    write sql queries at least 3 queries
    - with clause / subquery
    - aggregate function & group by
    - where ..
*/


CREATE TABLE customers (
  customer_id int,
  customer_name TEXT,
  telephone int,
  email TEXT,
  time_in TEXT,
  time_out TEXT
);

INSERT INTO customers values
    (1, 'Jessica Brown', 1234567890, 'jessica.brown@email.com', '2024-06-24 11:30:00', '2024-06-24 12:15:00'),
    (2, 'David Lee', 9876543210, 'david.lee@email.com', '2024-06-23 18:45:00', '2024-06-23 20:00:00'),
    (3, 'Sarah Kim', 5551212121, 'sarah.kim@email.com', '2024-06-22 12:00:00', '2024-06-22 13:30:00'),
    (4, 'Michael Johnson', 1112223333, 'michael.johnson@email.com', '2024-06-21 19:20:00', '2024-06-21 20:45:00');



    

CREATE TABLE menu (
  menuname TEXT,
  catagoly TEXT,
  price int
);
INSERT INTO menu values
    ('Cheeseburger', 'national food', 100),
    ('Veggie Wrap', 'national food', 80 ),
    ('Chicken Caesar Salad', 'national food', 120 ),
    ('Spaghetti Carbonara', 'national food', 150 ),
    ('Margherita Pizza', 'national food', 200 ),
    ('Fish and Chips', 'national food', 200 ),
    ('Grilled Salmon', 'national food', 250 ),
    ('Lobster Roll', 'national food', 300 ),
    ('Beef Stroganoff', 'national food', 250 ),
    ('Fire rice', 'thai food', 150 ),
    ('minced pork and holil basil stirfied', 'thai food', 150 ),
    ('Tom Yum Kung', 'thai food', 150 ),
    ('Pad Thai', 'thai food', 150 ),
    ('Pad See Ew', 'thai food', 150 ),
    ('crispy pork and holil basil stirfied', 'thai food', 150 ),
    ('seafood and holil basil stirfied', 'thai food', 150 ),
    ('chicken and holil basil stirfied', 'thai food', 150 ),
    ('squit and holil basil stirfied', 'thai food', 150 ),
    ('Coke' ,'drink', 20 ),
    ('Sprite' ,'drink', 20 ),
    ('Fanta' ,'drink', 20 ),
    ('Lemonade','drink', 20 ),
    ('Water' ,'drink', 20 )
    
;
    


CREATE TABLE orders (
  order_id int,
  customer_id int,
  menuname TEXT,
  amount int
);
INSERT INTO orders values
    (1, 1, 'Cheeseburger', 1),
    (2, 1, 'Fanta', 1),
    (3, 1, 'Spaghetti Carbonara', 1),
    (4, 1, 'Coke', 1),
    (5, 2, 'Margherita Pizza', 1),
    (6, 2, 'Sprite', 1),
    (7, 2, 'Lobster Roll', 1),
    (8, 2, 'Fanta', 1),
    (9, 3, 'Coke', 1),
    (10, 3, 'Water', 1),
    (11, 3, 'Pad Thai', 1),
    (12, 3, 'Pad See Ew', 2),
    (13, 4, 'Pad Thai', 1),
    (14, 4, 'Pad See Ew', 1),
    (15, 4, 'Pad See Ew', 1),
    (16, 4, 'Pad See Ew', 1),
    (17, 3, 'Coke', 1),
    (18, 3, 'Coke', 1),
    (19, 3, 'Coke', 1)
;
    
CREATE TABLE Transactions (
  customer_id int,
  employee_id int,
  price int,
  time_out TEXT
);

INSERT INTO transactions values
    (1, 1, 100, '2024-06-24 12:15:00'),
    (2, 2, 80, '2024-06-23 20:00:00'),
    (3, 3, 120, '2024-06-22 13:30:00'),
    (4, 4, 150, '2024-06-21 20:45:00');

.mode table
.header on
/*select * from customers;
select * from employee;
select * from menu;
select * from ingredient;
select * from Ordee;
select * from Transactio;*/

---total income
select catagoly ,SUM(price) as Total_revenue from menu 
Group by catagoly ;

---count of order by catagoly
select catagoly ,count(amount) as total_sell    
from menu
Join orders on menu.menuname = orders.menuname
group by catagoly;

---count of order by food
select menu.menuname,count(amount)
from menu
LEFT Join orders on menu.menuname = orders.menuname
group by menu.menuname;


SELECT menu.menuname, COALESCE(order_counts.total_sell, 0) AS total_sell
FROM menu
LEFT JOIN (
    SELECT menuname, COUNT(amount) AS total_sell
    FROM orders
    GROUP BY menuname
) AS order_counts ON menu.menuname = order_counts.menuname;




