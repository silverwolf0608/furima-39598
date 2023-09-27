FactoryBot.define do
  factory :user do
    nick_name { 'ニックネーム' }
    first_name { '名' }
    last_name { '性' }
    kana_first_name { 'メイ' }
    kana_last_name { 'セイ' }
    birthday { '1999-01-31' }
    email { Faker::Internet.email }
    password { 'pass012' }
    password_confirmation { password }
  end
end
