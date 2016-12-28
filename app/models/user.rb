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

  # validates_presence_of :name
  before_save :assign_role


  def assign_role
    self.role = Role.find_by name: "lr_minimal" if self.role.nil?
  end

  def lr_admin?
    self.role.name == "lr_admin"
  end

  def lr_minimal?
    self.role.name == "lr_minimal"
  end

  def lr_readonly?
    self.role.name == "lr_readonly"
  end
  
  def lr_create?
    self.role.name == "lr_create"
  end

  def lr_regular?
    self.role.name == "lr_regular"
  end

  def lr_supervisor?
    self.role.name == "lr_supervisor"
  end

  def lr_seller?
    self.role.name == "lr_seller"
  end
  
     
 
  private

  def password_update?
    password.present? || new_record?
  end

  belongs_to :role
end
