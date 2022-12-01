class Participation < ApplicationRecord
  belongs_to :gruppetto
  belongs_to :user
  enum :participation_status, { Pending: 0, Attending: 1, Rejected: 2 }, default: :Pending
end
