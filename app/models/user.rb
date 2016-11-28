class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #validates :email, presence: true, uniqueness: true, email: true
  validates :email, presence: true, uniqueness: true 
  

  def to_s
    # show columns contents, not record object like: 	#<Vehicle:0x007f343b3f2890>	2016-06-08
    "#{email},#{name}"
  end

  validates_presence_of :name
  before_save :assign_role


  def assign_role
    self.role = Role.find_by name: "sc_minimal" if self.role.nil?
  end

  def sc_admin?
    self.role.name == "sc_admin"
  end

  def sc_minimal?
    self.role.name == "sc_minimal"
  end

  def sc_readonly?
    self.role.name == "sc_readonly"
  end
  
  def sc_create?
    self.role.name == "sc_create"
  end

  def sc_regular?
    self.role.name == "sc_regular"
  end

  def sc_supervisor?
    self.role.name == "sc_supervisor"
  end

  def sc_seller?
    self.role.name == "sc_seller"
  end
  
     
 
  private

  def password_update?
    password.present? || new_record?
  end

  belongs_to :role
end
