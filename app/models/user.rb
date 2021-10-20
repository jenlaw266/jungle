class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true 
  validates :password, presence: true, length: { minimum: 3 }, confirmation: true
  validates_confirmation_of :password
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.strip)
    if @user 
      @user.authenticate(password)
    end
  end
end
