class CreateSearchHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :search_histories do |t|
      t.string :cep
      t.string :logradouro
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
