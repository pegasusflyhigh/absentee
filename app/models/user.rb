class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  belongs_to :role
  belongs_to :school

  validates_presence_of :name
  validates_format_of :mobile_number, :with =>  /\d[0-9]\)*\z/ , :message => "Mobile number not valid!"

  def is_admin?
    true
  end

end
