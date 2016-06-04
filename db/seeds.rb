# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rubygems'
require 'nokogiri'
require 'open-uri'
page = Nokogiri::HTML(open("http://www.languagedaily.com/learn-german/vocabulary/common-german-words"))

Card.destroy_all

page.css('tr.rowB').each do |row|
  original = row.css('td.bigLetter').text
  array_of_words = row.css('td')[2].text.split(' ')
  translated = array_of_words[0]
  Card.create(original_text: original, translated_text: translated)
end

page.css('tr.rowA').each do |row|
  original = row.css('td.bigLetter').text
  array_of_words = row.css('td')[2].text.split(' ')
  translated = array_of_words[0]
  Card.create(original_text: original, translated_text: translated)
end

