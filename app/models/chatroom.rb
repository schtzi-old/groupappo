class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :gruppetto
end
