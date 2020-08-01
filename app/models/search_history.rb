class SearchHistory < ApplicationRecord
  belongs_to :user
  validates :cep, :logradouro, :bairro, :cidade, :uf, presence: true
  validates_length_of :uf, is: 2

  def full_address
    "#{logradouro}, #{bairro}, #{cidade} - #{uf}"
  end
end
