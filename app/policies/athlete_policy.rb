class AthletePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end

    def new?
      true
    end

    def show?
      true
    end

    def edit?
      record.user == user
    end

    def update?
      record.user == user
    end
  end
end
