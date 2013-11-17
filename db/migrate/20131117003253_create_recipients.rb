class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :email
      t.references :upload

      t.timestamps
    end
  end
end
