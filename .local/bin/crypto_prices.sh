gst_price=$(curl -s --compressed https://coinmarketcap.com/currencies/green-satoshi-token/ | xmllint --html --xpath "//*[@id='__next']/div[1]/div[1]/div[2]/div/div[1]/div[3]/div/div[2]/div[1]/div/span/text()" - 2>/dev/null)
gmt_price=$(curl -s --compressed https://coinmarketcap.com/currencies/green-metaverse-token/ | xmllint --html --xpath "//*[@id='__next']/div[1]/div[1]/div[2]/div/div[1]/div[2]/div/div[2]/div[1]/div/span/text()" - 2>/dev/null)

echo "GST: $gst_price | GMT: $gmt_price"
