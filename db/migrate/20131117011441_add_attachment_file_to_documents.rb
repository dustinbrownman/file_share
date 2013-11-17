class AddAttachmentFileToDocuments < ActiveRecord::Migration
  def change
    change_table :documents do |t|
      t.attachment :attachment
      
    end
  end
end
