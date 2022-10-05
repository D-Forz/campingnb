class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # Only show bookings for the current user if any
      if user.bookings.any?
        scope.where(user: user)
      else
        raise Pundit::NotAuthorizedError, "must have a booking to view"
      end
    end
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end

  def show?
    record.user == user
  end
end
