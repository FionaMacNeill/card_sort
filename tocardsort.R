library(dplyr)

orig<- read.csv("~/RMarkdown/card_sort/db_wp.csv")

names(orig)

orig <- select(orig, post_title, post_status, guid)

pages <- filter(orig, post_status=="publish")

pages %>% summarise(count = sum(post_title=="" | guid==""))

pages <- filter(pages, post_title !="")
pages <- filter(pages, guid !="")

##write.csv(pages, file = "pages.csv")

pages_cards <- distinct(pages, post_title)

write.table(pages_cards,"pages_cards.txt",row.names=FALSE,sep="\t", quote = FALSE)