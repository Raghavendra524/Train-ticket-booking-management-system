class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:admin,:user]
  after_initialize :set_default_role, :if => :new_record?
  
  validates :first_name,:last_name,:mobile_no,:gender,:identity_proof_id ,presence: true

  has_many :trains
  has_many :schedules, through: :trains
  has_many :tickets , dependent: :destroy
  has_many :payments , dependent: :destroy
  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def set_default_role
    self.role ||= :user
  end
end
