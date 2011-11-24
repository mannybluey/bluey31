class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.roles.include?(Role.find_by_title('Admin'))
      can :manage, :all
      can :access, :rails_admin
    else
      can :read, Plan do |plan|
        plan && plan.creator.id == user.id
      end
    end
  end
end
