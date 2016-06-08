require 'nokogiri'
require 'open-uri'
page = Nokogiri::HTML(open("http://www.languagedaily.com/learn-german/vocabulary/common-german-words"))

Card.destroy_all

selected_links = []
links = page.css("a[rel=nofollow]").each { |link| selected_links.push('http://www.languagedaily.com' + link['href']) }

selected_links.each do |link|
  page = Nokogiri::HTML(open(link))
  page.css('tr').each do |row|
    if row.css('td')[2].text != ' ' || nil
      translated = row.css('td')[2].text
    end
    original = row.css('td.bigLetter').text if translated
    Card.create(original_text: original, translated_text: translated)
  end
end
