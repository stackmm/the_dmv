require './lib/facility'
require 'json'

class FacilityFactory
  def create_facility_oregon(data)
    data.map do |facility|
      address = JSON.parse(facility[:location_1][:human_address], symbolize_names: true)
      address_formatted = address.values.join(" ")

      Facility.new({
        name: facility[:title],
        address: address_formatted,
        phone: facility[:phone_number]
      })
    end
  end

  def create_facility_new_york(data)
    data.map do |facility|
      address = [facility[:street_address_line_1].split.map(&:capitalize).join(' '), 
                facility[:street_address_line_2], 
                facility[:city].capitalize, 
                facility[:state], 
                facility[:zip_code]].join(" ")
      
      Facility.new({
        name: facility[:office_name],
        address: address,
        phone: facility[:public_phone_number]
      })
    end
  end

end
