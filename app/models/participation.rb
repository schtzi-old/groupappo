class Participation < ApplicationRecord
  belongs_to :gruppetto
  belongs_to :user
  enum :participation_status, { pending: 0, attending: 1, rejected: 2 }, default: :pending
end
