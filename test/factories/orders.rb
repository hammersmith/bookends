FactoryGirl.define do
  factory :order do
    user_id 1
    status "MyString"
    created_on "2015-02-13"
    ordered_on "2015-02-13"
    pulled_on "2015-02-13"
    shipped_on "2015-02-13"
    ship_cost ""
    paid_on ""
    paid_amt "9.99"
  end

end
