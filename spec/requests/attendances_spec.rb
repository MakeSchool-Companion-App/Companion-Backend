require 'rails_helper'

RSpec.describe "Attendances", type: :request do
  let(:endpoint) { "/attendances" }
  let(:authenticated_user) { create(:user) }

  context "Unauthorized" do
    describe "GET /attendances" do
      it "should be unauthorized without token" do
        get endpoint
  
        expect(response).to have_http_status(401)
      end
    end

    describe "POST /attendances" do
      it "should be unauthorized without token" do
        attendance_attr = attributes_for(:attendance)

        post endpoint, :params => attendance_attr

        expect(response).to have_http_status(401)
      end
    end

    describe "PUT /attendance/id" do
      it "should be unauthorized without token" do
        attendance = create(:attendance)

        attendance.event_out = "2pm"

        put endpoint + "/#{attendance.id}", :params => attendance.attributes

        expect(response).to have_http_status(401)
      end
    end

    describe "DELETE /attendance/id" do
      it "should be unauthorized without token" do
        attendance = create(:attendance)

        put endpoint + "/#{attendance.id}"

        expect(response).to have_http_status(401)
      end
    end
  end

  context "Authorized" do
    describe "GET /attendance" do 
      it "should work with token" do
        get endpoint, headers: { 'Authorization' => "Token token=#{authenticated_user.token}" }
        
        expect(response).to have_http_status(200)
      end
    end

    describe "POST /attendance" do
      it "should be authorized with token" do
        attendance_attr = attributes_for(:attendance_without_associations)
        beacon = create(:beacon)

        attendance_attr["beacon_id"] = beacon.title
        attendance_attr["user_id"] = authenticated_user.id

        post endpoint, :params => attendance_attr, headers: { 'Authorization' => "Token token=#{authenticated_user.token}" }

        expect(response).to have_http_status(:created)
      end

      it "should fail creating attendance bc of validatation" do 
        attendance_attr = attributes_for(:attendance_invalid)

        post endpoint, :params => attendance_attr, headers: { 'Authorization' => "Token token=#{authenticated_user.token}" }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    describe "PUT /attendance/id" do
      it "should update and find attendance by updated value" do
        attendance = create(:attendance)

        attendance.event_out = "2pm"

        put endpoint + "/#{attendance.id}", :params => attendance.attributes, headers: { 'Authorization' => "Token token=#{attendance.user.token}" }

        expect(response).to have_http_status(:ok)
        expect(Attendance.where(event_out: "2pm").first).to_not be_nil
      end
    end

    describe "DELETE /attendance/id" do
      it "should delete attendance" do
        attendance = create(:attendance)

        delete endpoint + "/#{attendance.id}", headers: { 'Authorization' => "Token token=#{attendance.user.token}" }

        expect(response).to have_http_status(:no_content)
        expect(Attendance.first).to be_nil
      end
    end
  end
end
