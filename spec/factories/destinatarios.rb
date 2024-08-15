FactoryBot.define do
  factory :destinatario do
    cnpj { "MyString" }
    name { "MyString" }
    address { "MyString" }
    Report { nil }
  end
end
