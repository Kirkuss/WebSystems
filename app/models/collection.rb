class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_notes, dependent: :destroy;
end
