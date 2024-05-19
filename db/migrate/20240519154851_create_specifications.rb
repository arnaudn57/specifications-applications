class CreateSpecifications < ActiveRecord::Migration[7.0]
  def change
    create_table :specifications do |t|
      t.string :title
      t.text :description
      t.string :client_email
      t.string :token
      t.datetime :token_expiry

      t.timestamps
    end
  end
end
