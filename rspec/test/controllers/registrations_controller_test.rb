require 'rails_helper'

RSpec.describe "RegistrationsController", type: :request do

    describe "POST /registrations" do
        context 'When no authentication credentials are provided.' do
            before {
                post "/registrations"
            }

            it "fails when to authentication credentials are provided" do
                expect(response).to_not be_success
            end
        end
    end
end
