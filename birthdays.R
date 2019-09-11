library(ggplot2)

# What is your name?

# When is your birthdate? Only Month and day.
# Format "Month/date". For example for date "January 9th", we write "01/09"
my_name <- NULL
my_bd <- NULL

my_name[13] <- "Joseph"
my_bd[13] <- "01/08"

my_name[12] <- "Stacy"
my_bd[12] <- "02/17"

my_name[11] <- "Mary-Alice"
my_bd[11] <- "07/29"

my_name[10] <- "Aleks"
my_bd[10] <- "01/13"

my_name[9] <- "Victoria"
my_bd[9] <- "08/11"

my_name[8] <- "Jenny"
my_bd[8] <- "06/21"

my_name[7] <- "Diego"
my_bd[7] <- "10/03"

my_name[6] <- "Tugba"
my_bd[6] <- "05/02"

my_name[5] <- "Zafiro"
my_bd[5] <- "09/04"

my_name[4] <- "cyn"
my_bd[4] <- "10/17"

my_name[3] <- "Beyonce Knowles-Carter"
my_bd[3] <- "09/04"

my_name[1] <- "Michael"
my_bd[1] <- "12/15"

my_name[2] <- "Daniel"
my_bd[2] <- "12/14"




# When done, save, commit, push and make your first pull request.
###################################
df <- data.frame("names" = my_name ,
                 "birthdate" = as.Date(my_bd
                                       , "%m/%d") )
# Sort by date
df <- df[order(df$birthdate) , ]

same_bday <- df$birthdate[duplicated(df$birthdate)]

df %>% ggplot(mapping = aes(x = reorder(names, as.numeric(birthdate)), 
                            y = birthdate ) ) + 
        geom_point() +
        xlab("Names") + 
        ylab("Birthdates") +  
        labs(title = "Figure 1: Birthday of Participants", 
             subtitle = "Anybody with the same birthday?")+
        geom_hline(yintercept = same_bday, color = "red", show.legend=T)