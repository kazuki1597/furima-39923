FactoryBot.define do
    factory :user do
      name              {'test'}
      email                 {Faker::Internet.email}
      password              {'000aaa'}
      password_confirmation {password}
      last_name          {'太郎'}
      first_name          {'山田'}
      last_name_kana     {'タロウ'}
      first_name_kana   {'ヤマダ'} 
      birth_date        {Faker::Date.between(from: 20.year.ago, to: Date.today)}
    end
  end