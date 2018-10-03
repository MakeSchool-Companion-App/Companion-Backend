require 'test_helper'

'''So let us go over what these tests are doing
then we go into documentation
then we write better tests'''

# describe Order do
#   describe "#submit" do Describe what the submit action does
#
#     before do Before we start the tests complete these actions
#       @book = Book.new(:title => "RSpec Intro", :price => 20) Create an instance variable book
#       @customer = Customer.new Create a new customer
#       @order = Order.new(@customer, @book) Set up a new order object
#
#       @order.submit # Submit the order then end all serving to be done before we start the tests very human readable
#     end
#
#     describe "customer" do Since nested we can say describe what a customer does when they sumbit
#       it "puts the ordered book in customer's order history" do
#         expect(@customer.orders).to include(@order)
#         expect(@customer.ordered_books).to include(@book)
#       end
#     end
#
#     describe "order" do Describe what an order does when submitted
#       it "is marked as complete" do
#         expect(@order).to be_complete
#       end
#
#       it "is not yet shipped" do Describe what happens when not yet shipped when the submit actions occurs
#         expect(@order).not_to be_shipped
#       end
#     end
#   end
# end

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registration = registrations(:one) # Make an instance variable that is accessible throughout this class
  end

  test "should get index" do
    get registrations_url, as: :json
    assert_response :success
  end

  test "should create registration" do
    assert_difference('Registration.count') do
      post registrations_url, params: { registration: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show registration" do
    get registration_url(@registration), as: :json
    assert_response :success
  end

  test "should update registration" do
    patch registration_url(@registration), params: { registration: {  } }, as: :json
    assert_response 200
  end

  test "should destroy registration" do
    assert_difference('Registration.count', -1) do
      delete registration_url(@registration), as: :json
    end

    assert_response 204
  end
end
