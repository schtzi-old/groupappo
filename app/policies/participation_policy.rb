class ParticipationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    true
  end

  def destroy?
    true
  end

  def accept?
    update?
  end

  def reject?
    update?
  end

  def update?
    true
  end
end
