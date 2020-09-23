library(ggplot2)
library(magrittr)

# What is your name?
my_name[1] <- "Catlin"


# When is your birthdate? Only Month and day.
# month first, then day
my_bd[1] <- "03/05"

# Format "Month/date". For example for date "January 9th", we write "01/09"



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
