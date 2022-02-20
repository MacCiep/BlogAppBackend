FactoryBot.define do
  factory :article do
    user
    sequence(:title) {|n| "Title #{n}"}
    sequence(:content) {|n| "Content #{n}"}
    visible { true }
  end
end
