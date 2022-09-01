class ContractPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user:)
    end
  end

  def new?
    user.present?
  end

  def create?
    new?
  end

  def show?
    record.user == user
  end

  def edit?
    show?
  end

  def update?
    show?
  end

  def destroy?
    show?
  end
end
