class CreateUsers < ActiveRecord::Migration[5.2]
  #file for migrating to the database so that a table can be created
  def change
    create_table :users do |t|
      t.string :userid
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
