class Ability
  include CanCan::Ability

  def initialize(user)

    if user.sc_admin?
      can :manage, :all
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard                  # allow access to dashboard

    # remember to add roles to user.rb
    #
    # http://hibbard.eu/authentication-with-devise-and-cancancan-in-rails-4-2/  
    #

    elsif user.sc_regular?
      can :read, [ Role, User]
      
    elsif user.sc_readonly?
      can :read, Role
    end
    
  end
   
end

