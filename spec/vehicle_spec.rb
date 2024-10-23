require_relative '../lib/vehicle'

RSpec.configure do |config|
    config.formatter = :documentation
  end

RSpec.describe Vehicle do
    describe "#initialization" do
        it "exists" do 
            vehicle = Vehicle.new("2001", "Honda", "Civic")    
            
            expect(vehicle).to be_a Vehicle 
        end

        it 'assigns year/make/model to new vehicle' do
            vehicle = Vehicle.new("2001", "Honda", "Civic")    
           
            expect(vehicle.year).to eq("2001")
            expect(vehicle.make).to eq("Honda")
            expect(vehicle.model).to eq("Civic")
        end

        it 'assigns false to speeding variable upon initialization' do
            vehicle = Vehicle.new("2001", "Honda", "Civic")    

            expect(vehicle.speeding?).to eq(false)
        end
        
    end

    describe '#speed' do
        it 'reassigns #speeding to true' do
            vehicle = Vehicle.new("2001", "Honda", "Civic")    
            vehicle.speed
            expect(vehicle.speeding?).to eq(true)
        end
    end

end