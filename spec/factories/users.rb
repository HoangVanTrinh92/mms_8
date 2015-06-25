FactoryGirl.define do
  factory :user do
    sequence (:email) {|n| "trinh#{n}@gmail.com"}
    sequence (:name) {|n| "trinh#{n}"}
    password "12345678"
    password_confirmation "12345678"
    role "normal"
  end
end
