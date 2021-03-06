class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  belongs_to :role
  belongs_to :school

  validates_presence_of :name
  validates_format_of :mobile_number, with:  /[0-9]{10}/ , message: I18n.t('error.invalid', attribute: 'mobile number')

  def admin?
    self.role.name == 'Admin'
  end

  def clerk?
    self.role.name == 'Clerk'
  end

  def principal?
    self.role.name == 'Principal'
  end

  def teacher?
    self.role.name == 'Teacher'
  end

  def can_take_attendance(standard)
    clerk? || (standard.class_teacher == self)
  end
end
