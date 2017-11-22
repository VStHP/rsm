class Ability
  include CanCan::Ability

  def initialize user
    @user = user || User.new
    can :manage, Club
  end
end
