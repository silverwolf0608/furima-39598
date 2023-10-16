FactoryBot.define do
  factory :purchase_record_address do
    post_code {'900-0000'}
    prefecture_id {'2'}
    municipality {'仙台市宮城野区ダミー町'}
    street_address {'1-1-1'}
    building_name {'建物名'}
    telephone_number {'08000000000'}

  end
end
