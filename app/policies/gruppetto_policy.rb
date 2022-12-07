class GruppettoPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def search?
    true
  end

  def test?
    true
  end

  def show?
    true
  end

  def create?
    true
  end
end
