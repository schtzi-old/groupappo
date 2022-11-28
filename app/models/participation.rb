class Participation < ApplicationRecord
  belongs_to :gruppetto
  belongs_to :user
  enum :booking_status, { draft: 0, unconfirmed: 1, confirmed: 2, completed: 3, declined: 4 }, default: :draft
end
