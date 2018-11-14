require 'rails_helper'

RSpec.describe "Beacons", type: :request do
  describe "GET /beacons" do
    it "should work with token" do
      get '/beacons'
      
      expect(response).to have_http_status(401)
    end

    it "should be unauthorized without token" do
      get '/beacons'

      expect(response).to have_http_status(401)
    end
  end
end
