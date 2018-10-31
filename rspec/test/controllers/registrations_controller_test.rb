require 'rails_helper'
require 'rspec'
require 'rspec-rails'

RSpec.describe "RegistrationsController", type: :request do

    describe "POST /registrations" do
        context 'A valid registration request.' do
            before {
                post "/registrations", :user => {:email => "matthewharrilal@gmail.com", :image_url => "Hello World", :first_name => "Matthew", :last_name => "Harrilal"}
            }

            it "succeeds with valid attributes" do
                expect(response).to be_success
            end
        end
    end
end
