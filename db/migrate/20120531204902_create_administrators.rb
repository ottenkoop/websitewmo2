class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.string :name
      t.string :encrypted_password
      t.string :salt

      t.timestamps
    end
  end
end
