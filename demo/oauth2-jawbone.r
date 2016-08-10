library(httr)

# 1. Find OAuth settings for facebook:
#    http://developers.facebook.com/docs/authentication/server-side/
oauth_endpoints("jawbone")

# 2. Register an application at https://developers.facebook.com/apps/
#    Insert your values below - if secret is omitted, it will look it up in
#    the FACEBOOK_CONSUMER_SECRET environmental variable.
#Appname HelloWorldDM87 
myapp <- oauth_app("jawbone", "Zc-lm-tB06o", "e36d8adfb18681ff3775d62044e78f5eaa473790")

# 3. Get OAuth credentials
facebook_token <- oauth2.0_token(
  oauth_endpoints("jawbone"),
  myapp,
  type = "application/json"
)

# 4. Use API
url <- "https://jawbone.com/nudge/api/v.1.1/users/@me/sleeps"
req <- GET(url, config(token = facebook_token))
stop_for_status(req)
str(content(req))
