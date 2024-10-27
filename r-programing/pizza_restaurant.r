library(glue)
#1.chatbot order pizza
pizza <- list(menu = c("Hawaien","Seafood","Shrimp","Octopus","Chicken","Pork","Meat","Pepperoni","Double cheese"),
              price = c(299,     399,       399,      399,      249,     259,   299,      299,       299)
)
df_pizza <- as.data.frame(pizza)

beverage <- list( menu =  c("Coke","Fanta","Mineral","Orange juice","refil"),
                  price = c(39,39,20,39,59)

                  )
df_beverage = as.data.frame(beverage)
combine_menu <-rbind(df_pizza,df_beverage)
order_customer <- c()


chat_bot <- function(){
  print("hello welcome to pizza restaurant")
  print("this is menu")
  print(beverage$menu)
  order = readline("Do you want to order food or Beverage?(Yes/No):")
  total_price <- 0
  while(order == "Yes") {

    order_menu  <- readline("What menu your want to order: " )
    order_customer <- c(order_customer,order_menu)
    total_price <- total_price + combine_menu$price[order_menu == combine_menu$menu]

    order = readline("Do you want other menu?(Yes/No):")
    }
  check_bill = glue("Yours order are {order_customer}
                     Total price is {total_price}")
  print(check_bill)
}
chat_bot()
