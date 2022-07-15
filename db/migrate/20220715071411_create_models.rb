class CreateModels < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.text :password_digest, null: false

      t.timestamps
    end

    create_table :courses do |t|
      t.text :name, null: false, index: { unique: true }
      
      t.timestamps
    end
    
    create_table :courses_users do |t|
      t.references :user
      t.references :course

      t.integer :rating, null: true

      t.timestamps
    end
  end
end
