# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
 # attr_accessor :made_token
  has_secure_password
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness:  { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

private
  
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
    
# Returns the hash digest of the given string
 # def User.digest(string)
  #  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
   #                                                                   BCrypt::Engine.cost
 #   BCrypt::Password.create(string, cost: cost)
 # end
    
  # Returns a random token.
 # def User.new_token
  #  SecureRandom.urlsafe_base64
 # end
  
  # Remembers a user in the database for use in persistent sessions.
 # def remember
 # self.made_token = User.new_token
  #  update_attribute(:remember_token, User.digest(made_token))
 # end
    
    # Returns true if the given token matches the digest.
 # def authenticated? (made_token)
#	return false if remember_token.nil?
  #      BCrypt::Password.new(remember_token).is_password?(made_token)
#end

  # Forgets a user.
  #def forget
    #update_attribute(:remember_token, nil)
 # end    
    
end
  
    
     



