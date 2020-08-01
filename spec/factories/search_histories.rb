FactoryBot.define do
  factory :search_history do
    cep { ['85869-687', '85.869-687', '85869687', '85890-900'].sample }
    logradouro { Faker::Address.street_name }
    bairro { Faker::Address.community }
    cidade { Faker::Address.city }
    uf { ['AP', 'MG', 'RJ', 'SP', 'PR', 'RS', 'RN'].sample }
    user
  end
end
