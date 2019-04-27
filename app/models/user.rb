class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  belongs_to :role
  belongs_to :school

  validates_presence_of :name
  validates_format_of :mobile_number, with:  /[0-9]{10}/ , message: I18n.t('error.invalid', attribute: 'mobile number')

  def is_admin?
    self.role.name == 'Admin'
  end

  def is_clerk?
    self.role.name == 'Clerk'
  end

  def is_principal?
    self.role.name == 'Principal'
  end
end
