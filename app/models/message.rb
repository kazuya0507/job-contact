class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.

  validates :name, presence: true # Make sure the owner's name is present.

  has_many :okays, dependent: :destroy
  has_many :okays_messages, through: :okays, source: :message
end
