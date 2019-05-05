class CreateCollectionNoteAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :collection_note_attachments do |t|
      t.integer :collection_note_id
      t.string :avatar

      t.timestamps
    end
  end
end
