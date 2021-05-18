require 'nokogiri'
require 'httparty'

class Scraper
  attr_reader :data

  def initialize(url, element)
    hash_data = parse_document(url, element)
    @data = []
    if block_given?
      hash_data.each do |hash_element|
        @data.push(yield hash_element)
      end
    else
      @data = hash_data
    end
  end

  def generate_face
    @data[rand(@data.count)]
  end

  private

  def parse_document(url, element)
    unparsed_page = HTTParty.get(url)
    parsed_page ||= Nokogiri::HTML(unparsed_page.body)
    parsed_page.css(element)
  end
end
