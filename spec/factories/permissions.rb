FactoryGirl.define do
  factory :permission do
    user nil
    entity "MyString"
    create false
    read false
    update false
    destroy false
  end
end
