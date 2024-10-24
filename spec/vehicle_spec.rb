require_relative '../lib/vehicle'
require_relative '../lib/passenger'

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

    describe '#speeding?' do
        it 'defaults to false' do 
            vehicle = Vehicle.new("2001", "Honda", "Civic")    
            
            expect(vehicle.speeding?).to be false
        end
        
        it 'reassigns #speeding to true' do
            vehicle = Vehicle.new("2001", "Honda", "Civic")    
            vehicle.speed
            
            expect(vehicle.speeding?).to eq(true)
        end
    end

    describe '#passengers' do
        it 'starts as empty' do
            vehicle = Vehicle.new("2001", "Honda", "Civic")    
            expect(vehicle.passengers).to eq([])
        end

        it 'can add passengers' do
            vehicle = Vehicle.new("2001", "Honda", "Civic")    
            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20}) 
            taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
            
            vehicle.add_passenger(charlie)
            expect(vehicle.passengers.count).to eq(1)

            vehicle.add_passenger(jude)
            expect(vehicle.passengers.count).to eq(2)

            vehicle.add_passenger(taylor)
            expect(vehicle.passengers.count).to eq(3)

            expect(vehicle.passengers).to eq [charlie, jude, taylor]
        end

        it 'can count the number of adult passengers' do
            vehicle = Vehicle.new("2001", "Honda", "Civic")    
           
            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20}) 
            taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
            
            vehicle.add_passenger(charlie)
            vehicle.add_passenger(jude)
            vehicle.add_passenger(taylor)
            expect(vehicle.num_adults).to eq(2)
        end

    end

end