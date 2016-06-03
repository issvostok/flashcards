require 'nokogiri'
require 'open-uri'
page = Nokogiri::HTML(open("http://www.languagedaily.com/learn-german/vocabulary/common-german-words"))

Card.destroy_all

page.css('tr').each do |row|
  original = row.css('td.bigLetter').text
  translated = row.css('td')[2].text
  Card.create(original_text: original, translated_text: translated)
end

