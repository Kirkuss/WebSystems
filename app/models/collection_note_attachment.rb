class CollectionNoteAttachment < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	belongs_to :collection_note, required: false
end
