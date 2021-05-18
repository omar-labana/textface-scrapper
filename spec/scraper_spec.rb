require_relative '../lib/scraper'
describe Scraper do
  let(:scraper) { Scraper.new('https://textfac.es/', 'button.facebtn') do |face_tag|
    face_tag.attributes['data-clipboard-text'].value
  end 
  }
  let(:scraper2) { Scraper.new('https://textfac.es/', 'button.facebtn') }
  
  describe '#initialize constructor' do
    it 'Fetches HTML/XML data and maps it according to the passed bloack' do
      expect(scraper.data.class)
        .to eql(Array)
    end
    it 'Fetches HTML/XML data and maps it according to the passed bloack' do
      expect(scraper2.data.class)
        .to eql(Nokogiri::XML::NodeSet) # Hash equivilant
    end
  end

  describe '#generate_face' do
    it 'Return a random element(text face) from the data array' do
      expect(scraper.generate_face().class)
        .to eql(String)
    end
    it 'Return a random element(text face) from the data array' do
      expect(scraper2.data.class)
        .to eql(Nokogiri::XML::NodeSet) # Hash equivilant
    end
  end

end