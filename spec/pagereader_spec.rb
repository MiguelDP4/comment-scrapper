
require './lib/scrap_reader.rb'

describe PageReader do
  let(:reader){PageReader.new('https://www.udemy.com/')}

  describe '#search_by_name' do
    it 'searches courses with coinciding key' do
      expect(reader.search_by_name('redux')).to be_a(Array)
    end
    it 'searches courses with coinciding key' do
      expect(reader.search_by_name('redux')[0]).to be_a(Course)
    end
    it 'search courses with coinciding key' do
      expect(reader.search_by_name('redux')).not_to be_a(String)
    end
  end
end