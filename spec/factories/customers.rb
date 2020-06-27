FactoryBot.define do
  factory :customer do
    family_name_kanji { "田中" }
    first_name_kanji { "太郎" }
    family_name_kana { "タナカ" }
    first_name_kana { "タロウ" }
    email { "tanaka@tanaka.com" }
    postal_code { "1111111" }
    address { "埼玉県さいたま市" }
    phone { "12345678900" }
    password { "testtest" }
  end
  factory :second_customer do
    family_name_kanji { "佐藤" }
    first_name_kanji { "一郎" }
    family_name_kana { "サトウ" }
    first_name_kana { "イチロウ" }
    email { "satou@satou.com" }
    postal_code { "2222222" }
    address { "東京都新宿区" }
    phone { "99999999999" }
    password { "bbbbbb" }
  end
end