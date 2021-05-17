#!/usr/bin/env ruby
require_relative '../lib/scraper'
require 'nokogiri'
require 'httparty'
# require 'nokogiri'
# faces = Array.new
scraper = Scraper.new("https://textfac.es/", 'button.facebtn') {
  | face_tag |
  face_tag.attributes["data-clipboard-text"].value
}
p scraper.generate_face()