class Park 
    attr_accessor :name, :admission, :vehicles, :passengers, :admission_collected

    def initialize(name, admission)
        @name = name
        @admission = admission
        @vehicles = []
        @passengers = []
        @admission_collected = 0
    end

    def add_vehicle(vehicle)
        @vehicles << vehicle
    end
    
    def passengers
        all_passengers = []
        @vehicles.each do |vehicle|
            vehicle.passengers.each do |passenger|
                all_passengers << passenger
            end
        end
        all_passengers
    end

    def admission_collected
        total = 0
        passengers.each do |passenger|
            if passenger.adult?
                total += admission
            end
        end
        total
    end

    def attendee_names
        passengers.map do |passenger|
            passenger.name
        end.sort
    end

    def minors 
        minor_list = passengers.select do |passenger|
           !passenger.adult?
        end
        minor_list.sort_by do |minor|
            minor.name
        end
    end
end
