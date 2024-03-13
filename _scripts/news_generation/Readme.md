# News Readme

## How to update news items

Run `news_rss.R` and `news_apis.R` to pull new news items and create RMDs.

This will happen automatically on Github however, every day at midnight.

## Blocklist

If a source is undesired, such as Breitbart News, add the source to the blocklist.txt file. It needs to match the "source" column value in existing_news.Rmd.  If the bad source has already been rendered, you will need to manually delete the qmds and html and then re-render the site to get it to apply to news.html.
