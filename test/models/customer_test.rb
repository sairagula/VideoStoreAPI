require "test_helper"

describe Customer do
  let(:customer) { Customer.new }

  describe "validations" do
    it "can be created if all fields are provided" do
      start_count = Customer.count
      c = Customer.new(name: "Tamira", registered_at: "Date registered", address: "An address", city: "Seattle", state: "WA", postal_code: "zip", phone: "111111111", account_credit: 15.50)

      c.must_be :valid?

      c.save
      Customer.count.must_equal start_count + 1
    end # can be created

    it "can't be created without a title" do
      start_count = Customer.count
      c = Customer.new(registered_at: "Date registered", address: "An address", city: "Seattle", state: "WA", postal_code: "zip", phone: "111111111", account_credit: 15.50)

      c.wont_be :valid?
      c.errors.messages.must_include :name

      # can't be saved because it isn't valid
      c.save
      Customer.count.must_equal start_count

    end
  end # validations

  # describe "custom methods" do
  #   describe "movies_checked_out" do
  #     it "will return a list of the checkout out movies for that customer" do
  #       get customers_path
  #
  #       body = JSON.parse(response.body)
  #       body[0][:movies_checked_out].must_equal 0
  #     end
  #   end # movies_checked_out
  # end # custom methods
end
