FactoryBot.define do
  factory :report do
    serie { "MyString" }
    n_nf { "MyString" }
    dh_emi { "2024-08-15 10:35:42" }
    products_total_value { "9.99" }
    icms_total { "9.99" }
    ipi_total { "9.99" }
    pis_total { "9.99" }
    cofins_total { "9.99" }
    Document { nil }
  end
end
