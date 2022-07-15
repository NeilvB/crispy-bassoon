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

    create_join_table :users, :courses do |t|
      t.index :user_id
      t.index :course_id

      t.timestamps
    end
  end
end
