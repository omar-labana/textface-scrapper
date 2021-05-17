require 'nokogiri'
require 'httparty'

class Scraper
  attr_reader :hash_data 

  def initialize(url, element)
    unparsed_page = HTTParty.get(url)
    parsed_page ||= Nokogiri::HTML(unparsed_page.body)
    hash_data = parsed_page.css(element)
    @data = []
    if block_given?
      hash_data.each { |element|
        @data.push( yield element)
      }
    else
      @data = hash_data 
    end
  end

  def generate_face

  end
end