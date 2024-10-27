library(tidyverse)
install.packages("RSQLite")
library(RSQLite)
library(tidyverse)
library(RSQLite)
## menu
con <- dbConnect(SQLite(), "restaurant.db")
print(dbIsValid(con))
menu_df <- data.frame(
  menuname =
    c("boiled chicken rice",
      "fired chicken rice",
      "stewed duck rice",
      "boiled chicken size S",
      "boiled chicken size M",
      "fired chicken size S",
      "fired chicken size M",
      "stewed duck size M",
      "stewed duck size L",
      "mineral",
      "krajeab",
      "vegetable soup",
      "bamboo shoot soup"  ),
  catagoly = c("food","food","food","food","food","food","food","food","food","drink","drink","soup","soup"),
  price = c("50","50","50","100","150","100","150","100","150","10","20","30","30")
)

customer_df <- data.frame(
  customer_id = c(1, 2, 3, 4),
  customer_name = c("Jessica Brown", "David Lee", "Sarah Kim", "Michael Johnson"),
  customer_telephone = c(1234567890, 9876543210, 5551212121, 1112223333),
  customer_email = c("jessica.brown@email.com", "david.lee@email.com", "sarah.kim@email.com", "michael.johnson@email.com"),
  time_in = c('2024-06-24 11:30:00', '2024-06-23 18:45:00', '2024-06-22 12:00:00', '2024-06-21 19:20:00'),
  time_out = c('2024-06-24 12:15:00', '2024-06-23 20:00:00', '2024-06-22 13:30:00', '2024-06-21 20:45:00') )


order_df <- data.frame(
  order_id = c(1,2,3,4,5,6,7,8,9),
  customer_id = c(1,1,1,2,2,2,3,3,4),
  menuname = c("boiled chicken rice",
               "mineral",
               "krajeab",
               "stewed duck size M",
               "stewed duck size L",
               "krajeab",
               "stewed duck size M",
               "stewed duck size L",
               "stewed duck size M"),
  amount = c(2,1,1,1,1,1,1,1,1)
)


transaction_df <- data.frame(
  customer_id =c(1,2,3,4),
  employee_id =c(1,1,2,1),
  price =c(80,270,250,100),
  time_out =c('2024-06-24 12:15:00','2024-06-23 13:00:00','2024-06-24 13:15:00','2024-06-24 15:15:00')
)

dbWriteTable(con,"menu",menu_df)
dbWriteTable(con,"customer",customer_df)
dbWriteTable(con,"orders",order_df)
dbWriteTable(con,"transactions",transaction_df)
dbListTables(con)
dbDisconnect(con)
