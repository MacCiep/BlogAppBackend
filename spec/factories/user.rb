FactoryBot.define do
  factory :user do
    email {FFaker::Internet.disposable_email}
    password {FFaker::Internet.password}
    name {FFaker::Name.first_name}
    lastname {FFaker::Name.last_name}
    username {FFaker::Internet.user_name}
  end
end