library(dplyr)
df <- read.csv("AirBnB.csv")
names(df)
df <- df %>% 
  select(
    -host_id,
    -host_name,
    -host_since_year,
    -host_since_anniversary,
    -Customer.Since,
    -id, 
    -city,
    -state,
    -latitude,
    -longitude,
    -`customers...50..review.rate`,
    -`X.Daily.Rev.per.2.guests..unless.limited.to.1.`,
    
    -`customers...50..review.rate`,        # not sure if you still need this col??
    -`X.Daily.Rev.per.2.guests..unless.limited.to.1.`,     # and this one??
    -number_of_reviews      # and this ?? 
    )

df <- df %>%
  rename(
    age.of.exp = Age.in.years,
    neighbourhood = neighbourhood_cleansed,
    city = city_translated,
    state = state_translated,
  )

df$Total.Rev <- as.character(df$Total.Rev)
df$Total.Rev.clean <- gsub("[$,]", "", df$Total.Rev)
df <- df[!is.na(suppressWarnings(as.numeric(df$Total.Rev.clean))), ]
df$Total.Rev <- as.numeric(df$Total.Rev.clean)
df$Total.Rev.clean <- NULL

df$price <- as.numeric(gsub("[$[:space:]]", "", df$price))
df$minimum_nights <- as.numeric(gsub("[$[:space:]]", "", df$minimum_nights))

