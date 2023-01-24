require 'httparty'
require 'therubyracer'
require 'execjs'


url = "https://www.nasa.gov/press-release/nasa-industry-to-collaborate-on-space-communications-by-2025"
response = HTTParty.get(url)

context = ExecJS.compile(response.body)
article_text = context.eval("document.querySelector('.article-text').innerText")

puts article_text

