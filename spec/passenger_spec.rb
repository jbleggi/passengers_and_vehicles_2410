require './lib/passenger'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Passenger do 
  describe "instantiation" do 
    it "exists" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  

      expect(charlie).to be_a Passenger
    end

    it 'assigns age and name to new passenger' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
      expect(charlie.name).to eq('Charlie')
      expect(charlie.age).to eq(18)
    end

    it 'assigns false to driver status' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      expect(charlie.driver?).to eq(false)
    end

  end

  describe '#adult?' do
    it 'assigns true if passenger age is 18 or higher' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
      taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 

      expect(charlie.adult?).to eq(true)
      expect(taylor.adult?).to eq(false)
    end
  end

  describe '#drive' do
    it 'reassigns driver to true' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      charlie.drive
      expect(charlie.driver?).to eq(true)
    end
  end
  
end