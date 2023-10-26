FactoryBot.define do
factory :pay_purchase, aliases: [:pay_purchases] do
     
      token              {'tok_abcdefghijk00000000000000000'}
      postal_code                 {'111-1111'}
      prefecture_id              {2}
      city                       {'苅田'}
      building                   {'レオパレス'}
      addlesses                  {'1-1-1'}
      phone_number               {'0902202200'}
      
    end
  end
