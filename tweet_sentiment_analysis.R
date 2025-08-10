# 🧠 Sentiment Analysis of Tweets in R

# -----------------------------
# 1️⃣ Install & Load Libraries
# -----------------------------
packages <- c("rtweet", "tidyverse", "tidytext", "syuzhet", "wordcloud", "RColorBrewer", "ggplot2")

install_if_missing <- function(pkg) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg, dependencies = TRUE)
    library(pkg, character.only = TRUE)
  }
}

invisible(lapply(packages, install_if_missing))

# -----------------------------
# 2️⃣ Authenticate with Twitter API
# -----------------------------
# You must set your Twitter API credentials before running
# Use rtweet::create_token() or environment variables
# Example:
# token <- rtweet::create_token(
#   app = "your_app_name",
#   consumer_key = "your_consumer_key",
#   consumer_secret = "your_consumer_secret",
#   access_token = "your_access_token",
#   access_secret = "your_access_secret"
# )

# -----------------------------
# 3️⃣ Fetch Tweets
# -----------------------------
query <- "data science"
tweet_count <- 200

tweets <- search_tweets(
  q = query,
  n = tweet_count,
  lang = "en",
  include_rts = FALSE
)

cat("✅ Fetched", nrow(tweets), "tweets for query:", query, "\n")

# -----------------------------
# 4️⃣ Clean & Tokenize Tweets
# -----------------------------
tweet_words <- tweets %>%
  select(status_id, text) %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words, by = "word") %>%
  filter(!str_detect(word, "^@"), !str_detect(word, "^[0-9]+$"))

# -----------------------------
# 5️⃣ Sentiment Scoring (Syuzhet)
# -----------------------------
sentiment_scores <- get_nrc_sentiment(tweet_words$word)
sentiment_summary <- colSums(sentiment_scores)

# -----------------------------
# 6️⃣ Plot Sentiment Scores
# -----------------------------
sent_df <- data.frame(sentiment = names(sentiment_summary), score = sentiment_summary)

ggplot(sent_df, aes(x = reorder(sentiment, score), y = score, fill = sentiment)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = paste("Sentiment Analysis for Tweets on:", query),
       x = "Sentiment",
       y = "Score") +
  theme_minimal()

# -----------------------------
# 7️⃣ Wordcloud
# -----------------------------
word_freq <- tweet_words %>%
  count(word, sort = TRUE)

set.seed(1234)
wordcloud(
  words = word_freq$word,
  freq = word_freq$n,
  min.freq = 2,
  max.words = 100,
  random.order = FALSE,
  colors = brewer.pal(8, "Dark2")
)

cat("✅ Sentiment Analysis Complete!\n")
