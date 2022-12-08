class Participation < ApplicationRecord
  belongs_to :gruppetto
  belongs_to :user

  enum :participation_status, { Pending: 0, Attending: 1, Rejected: 2 }, default: :Pending

  has_noticed_notifications
  # after_create_commit :notify_pending_participant
  after_update_commit :notify_accepted_participant

  def notify_pending_participant
    NewParticipationRequest.with(participation: self).deliver_later(gruppetto.user)
  end

  def notify_accepted_participant
    AcceptedParticipantRequest.with(participation: self).deliver_later(user)
  end
end
