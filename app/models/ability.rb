# frozen_string_literal: true

class Ability
  include CanCan::Ability

  # rubocop:disable Metrics/MethodLength
  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    if user.present?
      can :manage, User, id: user.id
      cannot :edit_role, User
      cannot :index, Feedback
    end

    user ||= User.new # guest user (not logged in)
    can %i[read create], User
    can :read, :events
    can %i[new create], Feedback

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :event_manager
      can :manage, Event
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
  # rubocop:enable Metrics/MethodLength
end
