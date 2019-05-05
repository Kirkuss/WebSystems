class CollectionNote < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :collection, required: false
  has_many :collection_note_attachments
  accepts_nested_attributes_for :collection_note_attachments
end
