FactoryBot.define do
  factory :document do
    xml_file { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/CASE_001.xml')) }
    user { nil }
  end
end
