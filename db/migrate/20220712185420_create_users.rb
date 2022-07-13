class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.text :email, :unique
      t.text :name

      t.timestamps
    end
  end
end
