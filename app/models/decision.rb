class Decision < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user
  has_many :conversation_messages
end
