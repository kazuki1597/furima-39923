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

#   self.data = [
#     { id: 1, name: '---' },
#     { id: 2, name: 'レディース' },
#     { id: 3, name: 'メンズ' },
#     { id: 4, name: 'ベビー・キッズ' },
#     { id: 5, name: 'インテリア・住まい・小物' },
#     { id: 6, name: '本・音楽・ゲーム' },
#     { id: 7, name: 'おもちゃ・ホビー・グッズ' },
#     { id: 8, name: '家電・スマホ・カメラ' },
#     { id: 9, name: 'スポーツ・メジャー' },
#     { id: 10, name: 'ハンドメイド' },
#     { id: 11, name: 'その他' }
#   ]
#   end
# end
