class Ability
  include CanCan::Ability

  def initialize(user)

    if user.lr_admin?
      can :manage, :all
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard,  :all                # allow access to dashboard

    # remember to add roles to user.rb
    #
    # http://hibbard.eu/authentication-with-devise-and-cancancan-in-rails-4-2/  
    #

    elsif user.lr_regular?
      can :read, [ Product, Role, User ]
      can [ :create, :update, :destroy, ], [ Product, ]
      # can history
    
    elsif user.lr_readonly?
      can :read, [ Product, Role, User, CountryOfOrigin ]
      can :dashboard, :all
    end
    
  end
   
end

