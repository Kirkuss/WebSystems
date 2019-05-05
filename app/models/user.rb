class User < ApplicationRecord
	has_many :notes, dependent: :destroy
	has_many :collections, dependent: :destroy
	has_many :collection_notes, dependent: :destroy
	has_friendship
end
