FactoryBot.define do
  factory :message do
    name {Faker::Lorem.sentence}
    attachment {File.open("#{Rails.root}/public/images/test_image.jpg")}
    user
    group
  end
end
