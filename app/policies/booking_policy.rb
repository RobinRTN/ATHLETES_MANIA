class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def accept?
    true
  end

  def refuse?
    true
  end

  def canceled?
    true
  end

  def new?
    create?
  end

  def create?
    record.athlete.user != user
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end
end
