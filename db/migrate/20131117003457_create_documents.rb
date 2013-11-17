class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :upload

      t.timestamps
    end
  end
end
