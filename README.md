# 🧠 Sentiment Analysis of Tweets

## 📌 Overview
This project performs **sentiment analysis** on tweets related to a specific search query.  
It uses the **Twitter API** to fetch tweets, cleans and tokenizes them, and applies the **NRC Emotion Lexicon** to classify sentiment into emotions (e.g., joy, anger, trust) and polarities (positive, negative).  
It also generates **bar charts** and **wordclouds** for visualization.

---

## 🚀 Features
- Fetches tweets using `rtweet`
- Cleans and tokenizes text
- Removes stopwords, numbers, and mentions
- Sentiment classification with `syuzhet`
- Visualization:
  - Sentiment bar chart
  - Wordcloud

---

## 📂 Dataset
- Source: Twitter API (via `rtweet`)
- Data is live and depends on your query

---

## 🛠️ Requirements
- **R >= 4.0**
- R Packages:
  ```r
  install.packages(c("rtweet", "tidyverse", "tidytext", "syuzhet", "wordcloud", "RColorBrewer", "ggplot2"))
  ```

---

## 🔑 Setup
1. Create a **Twitter Developer Account** and get API keys.
2. Authenticate with:
   ```r
   token <- rtweet::create_token(
     app = "your_app_name",
     consumer_key = "your_consumer_key",
     consumer_secret = "your_consumer_secret",
     access_token = "your_access_token",
     access_secret = "your_access_secret"
   )
   ```
3. Save this script as `tweet_sentiment_analysis.R`.

---

## ▶️ How to Run
```r
source("tweet_sentiment_analysis.R")
```

---

## 📊 Output
- **Sentiment Bar Chart** (positive, negative, joy, anger, etc.)
- **Wordcloud** of frequent terms
- Sentiment scores printed in console

---

## 📁 Project Structure
```bash
tweet-sentiment-analysis/
│
├── tweet_sentiment_analysis.R   # Main R script
├── README.md                    # Project documentation
└── (generated plots)            # Sentiment bar chart & wordcloud
```

---

## 📌 Example
- **Query:** `"data science"`
- **Tweets fetched:** 200

---

## 📜 License
MIT License
