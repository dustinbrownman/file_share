class CreateSenders < ActiveRecord::Migration
  def change
    create_table :senders do |t|
      t.string :name
      t.string :email
      t.references :upload

      t.timestamps
    end
  end
end
