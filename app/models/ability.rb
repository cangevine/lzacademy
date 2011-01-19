class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= Parent.new # guest parent user (not logged in)
    
    if user.role?(:admin)
      can :manage, :all
      
    elsif user.role?(:parent)
      can :read, [Course, Location, Program]
      can [:show, :update], Parent, :id => user.id
      can :create, Student
      can :manage, Student do |s|
        s.try(:parent) == user
      end
      can :create, Registration
      can [:read, :destroy], Registration do |r|
        r.try(:student).try(:parent).id == user.id
      end
      can :create, EmergencyForm
      can :manage, EmergencyForm do |ef|
        ef.try(:student).try(:parent).try(:id) == user.id
      end
      
    elsif user.role?(:teacher)
      can :read, [Location, SessionTerm, Course, Program, Registration, Student, EmergencyForm]
      can :manage, Comment do |c|
        c.try(:registration).try(:course).try(:teacher) == user
      end
      can :manage, Teacher do |t|
        t.id == user.id
      end
      
    else
      can [:create, :sign_in, :sign_out], Parent
      can [:sign_in, :sign_out], Teacher
      can :read, [Course, Program, Location]
    end
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
