#!/usr/bin/env ruby

require_relative '../lib/scraper'
require 'nokogiri'
require 'httparty'

scraper = Scraper.new('https://textfac.es/', 'button.facebtn') do |face_tag|
  face_tag.attributes['data-clipboard-text'].value
end
p scraper.generate_face
