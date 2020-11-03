FactoryBot.define do
  factory :f_user do
    nickname                {Faker::Name.initials(number: 2)}
    email                   {Faker::Internet.free_email}
    password                {"test123"}
    password_confirmation   {password}
    last_name               {"山本"}
    first_name              {"消費"}
    last_name_kana          {"ヤマモト"}
    first_name_kana         {"ショウヒ"}
    birthday                {"2001-1-1"}
  end
end
