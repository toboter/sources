class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user
      can :read, :all
      can :manage, :all if user.is_admin?
    end

    # if user
    #   can [:show, :view_file], Subject, Subject do |s|
    #     s.readable_by?(user)
    #   end
    #   can [:edit, :update, :destroy], Subject, Subject do |s|
    #     s.editable_by?(user)
    #   end
    #   can :update_multiple, Subject if user.is_admin?
    #   can [:new, :create], Subject if user.is_admin? || user.is_creator?
    #   
    # else
    #   can [:read, :view_file], Subject, published?: true
    # end

    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
