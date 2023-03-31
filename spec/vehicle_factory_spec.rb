require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wav_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end
end