class Facility
  attr_reader :name, :address, 
              :phone, :services,
              :registered_vehicles, 
              :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if services.include?("Vehicle Registration")
      collect_registration_fee(vehicle)
      vehicle.set_plate_type
      vehicle.set_registration_date
      @registered_vehicles << vehicle
    else
      "Service not provided at this facility"
    end
  end

  def collect_registration_fee(vehicle)
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end

  def administer_written_test(registrant)
    if services.include?("Written Test")
      if registrant.permit? && registrant.age >= 16
        registrant.license_data[:written] = true
      else
        "Not qualified for written test"
      end
    else
      "Service not provided at this facility"
    end
  end

end
