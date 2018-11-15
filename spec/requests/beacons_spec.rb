require 'rails_helper'

RSpec.describe "Beacons", type: :request do
  let(:endpoint) { "/beacons" }
  let(:authenticated_user) { create(:authenticated_user) }

  context "Unauthorized" do
    describe "GET /beacons" do
      it "should be unauthorized without token" do
        get endpoint
  
        expect(response).to have_http_status(401)
      end
    end

    describe "POST /beacons" do
      it "should be unauthorized without token" do
        beacon_attr = attributes_for(:beacon)

        post endpoint, :params => beacon_attr

        expect(response).to have_http_status(401)
      end
    end

    describe "PUT /beacons/id" do
      it "should be unauthorized without token" do
        beacon = create(:beacon)

        beacon.hardware_id = "Homebase"

        put endpoint + "/#{beacon.id}", :params => beacon.attributes

        expect(response).to have_http_status(401)
      end
    end

    describe "DELETE /beacons/id" do
      it "should be unauthorized without token" do
        beacon = create(:beacon)

        put endpoint + "/#{beacon.id}"

        expect(response).to have_http_status(401)
      end
    end
  end

  context "Authorized" do
    describe "GET /beacons" do 
      it "should work with token" do
        get endpoint, headers: { 'Authorization' => "Token token=#{authenticated_user.token}" }
        
        expect(response).to have_http_status(200)
      end
    end

    describe "POST /beacons" do
      it "should be authorized with token" do
        beacon_attr = attributes_for(:beacon)

        post endpoint, :params => beacon_attr, headers: { 'Authorization' => "Token token=#{authenticated_user.token}" }

        expect(response).to have_http_status(:created)
      end

      it "should fail creating beacon bc of validatation" do 
        beacon_attr = attributes_for(:beacon_invalid)

        post endpoint, :params => beacon_attr, headers: { 'Authorization' => "Token token=#{authenticated_user.token}" }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    describe "PUT /beacons/id" do
      it "should update and find beacon by updated value" do
        beacon = create(:beacon)

        beacon.hardware_id = "Homebase"

        put endpoint + "/#{beacon.id}", :params => beacon.attributes, headers: { 'Authorization' => "Token token=#{authenticated_user.token}" }

        expect(response).to have_http_status(:ok)
        expect(Beacon.where(hardware_id: "Homebase").first).to_not be_nil
      end
    end

    describe "DELETE /beacons/id" do
      it "should delete beacon" do
        beacon = create(:beacon)

        delete endpoint + "/#{beacon.id}", headers: { 'Authorization' => "Token token=#{authenticated_user.token}" }

        expect(response).to have_http_status(:no_content)
        expect(Beacon.first).to be_nil
      end
    end
  end
end
