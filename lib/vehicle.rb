class Vehicle
    attr_reader :year, :make, :model, :speeding, :passengers

    def initialize(year, make, model)
        @year = year
        @make = make
        @model = model
        @speeding = false
        @passengers = []
    end

    def speeding? 
        @speeding
    end

    def speed
        @speeding = true
    end

    def add_passenger(passenger)
        @passengers << passenger
    end

    def num_adults
        # @passengers.count { |passenger| passenger.adult? }
        adults = 0
        @passengers.each do |passenger|
            if passenger.adult? 
                adults += 1
            end
        end
        adults
    end
end