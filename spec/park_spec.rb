require './lib/park'
require './lib/passenger'
require './lib/vehicle'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Park do
    describe 'instantiation' do
        it 'exists' do
            park = Park.new('Shenandoah', 20)
            
            expect(park).to be_a Park
        end
         
        it 'has a name and admission cost' do
            park = Park.new('Shenandoah', 20)

            expect(park.name).to eq('Shenandoah')
            expect(park.admission).to eq(20)
            
        end
  
    end
    
    describe '#vehicles' do
        it 'starts as empty' do
            park = Park.new('Shenandoah', 20)

            expect(park.vehicles).to eq([])
        end

        it 'can add vehicles' do
            park = Park.new('Shenandoah', 20)
            vehicle1 = Vehicle.new("2001", "Honda", "Civic") 
            vehicle2 = Vehicle.new("2018", "VW", "Tiguan")
            vehicle3 = Vehicle.new("2016", "Ford", "Fiesta")
        
            park.add_vehicle(vehicle1)
            park.add_vehicle(vehicle2)
            park.add_vehicle(vehicle3)

    
            expect(park.vehicles).to eq [vehicle1, vehicle2, vehicle3]
        end
    end

    describe '#passengers' do
        it 'starts as empty' do
            park = Park.new('Shenandoah', 20)

            expect(park.passengers).to eq([])
        end

        it 'lists all passengers' do
            park = Park.new('Shenandoah', 20)
            
            vehicle1 = Vehicle.new("2001", "Honda", "Civic") 
            vehicle2 = Vehicle.new("2018", "VW", "Tiguan")
            vehicle3 = Vehicle.new("2016", "Ford", "Fiesta")

            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20}) 
            taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
            bob = Passenger.new({"name" => "Bob", "age" => 35}) 
            ruby = Passenger.new({"name" => "Ruby", "age" => 9}) 

            vehicle1.add_passenger(taylor)
            vehicle1.add_passenger(jude)
            vehicle2.add_passenger(charlie)       
            vehicle3.add_passenger(bob)
            vehicle3.add_passenger(ruby)    
            
            park.add_vehicle(vehicle1)
            park.add_vehicle(vehicle2)
            park.add_vehicle(vehicle3)

            expect(park.passengers).to eq [taylor, jude, charlie, bob, ruby]

        end
    end

    describe '#admission_collected' do
        it 'calculates revenue for park' do
            park = Park.new('Shenandoah', 20)
            
            vehicle1 = Vehicle.new("2001", "Honda", "Civic") 
            vehicle2 = Vehicle.new("2018", "VW", "Tiguan")
            vehicle3 = Vehicle.new("2016", "Ford", "Fiesta")
    
            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20}) 
            taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
            bob = Passenger.new({"name" => "Bob", "age" => 35}) 
            ruby = Passenger.new({"name" => "Ruby", "age" => 9}) 
    
            vehicle1.add_passenger(taylor)
            vehicle1.add_passenger(jude)
            vehicle2.add_passenger(charlie)       
            vehicle3.add_passenger(bob)
            vehicle3.add_passenger(ruby)    
                
            park.add_vehicle(vehicle1)
            park.add_vehicle(vehicle2)
            park.add_vehicle(vehicle3)

            expect(park.admission_collected).to eq 60
        end
    end

    describe "#attendee_names" do
        it "lists all names in ABC order" do
            park = Park.new('Shenandoah', 20)
            
            vehicle1 = Vehicle.new("2001", "Honda", "Civic") 
            vehicle2 = Vehicle.new("2018", "VW", "Tiguan")
            vehicle3 = Vehicle.new("2016", "Ford", "Fiesta")

            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20}) 
            taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
            bob = Passenger.new({"name" => "Bob", "age" => 35}) 
            ruby = Passenger.new({"name" => "Ruby", "age" => 9}) 

            vehicle1.add_passenger(taylor)
            vehicle1.add_passenger(jude)
            vehicle2.add_passenger(charlie)       
            vehicle3.add_passenger(bob)
            vehicle3.add_passenger(ruby)    
            
            park.add_vehicle(vehicle1)
            park.add_vehicle(vehicle2)
            park.add_vehicle(vehicle3)

            expected = ["Bob", "Charlie", "Jude", "Ruby", "Taylor"]

            expect(park.attendee_names).to eq expected
        end
    end

    describe "#minors" do
        it 'returns list of all minors' do
            park = Park.new('Shenandoah', 20)
            
            vehicle1 = Vehicle.new("2001", "Honda", "Civic") 
            vehicle2 = Vehicle.new("2018", "VW", "Tiguan")
            vehicle3 = Vehicle.new("2016", "Ford", "Fiesta")

            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20}) 
            taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
            bob = Passenger.new({"name" => "Bob", "age" => 35}) 
            ruby = Passenger.new({"name" => "Ruby", "age" => 9}) 

            vehicle1.add_passenger(taylor)
            vehicle1.add_passenger(jude)
            vehicle2.add_passenger(charlie)       
            vehicle3.add_passenger(bob)
            vehicle3.add_passenger(ruby)    
        
            park.add_vehicle(vehicle1)
            park.add_vehicle(vehicle2)
            park.add_vehicle(vehicle3)

            expect(park.minors).to eq([ruby, taylor])
        end
    end
end

