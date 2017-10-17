class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user
      can :show, Subject, Subject do |s|
        s.readable_by?(user)
      end
      can [:edit, :update, :destroy], Subject, Subject do |s|
        s.editable_by?(user)
      end
      can [:new, :create], Subject if user.is_admin? || user.is_creator?
    else
      can :read, Subject, published?: true
    end

    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
