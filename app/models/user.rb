require 'digest/sha2'

class User < ActiveRecord::Base
  validates_uniqueness_of :name
  belongs_to :team

  def self.authenticate(name, password)
    user = User.find(:first, :conditions => ['name = ?', name])
    if user.blank? || Digest::SHA256.hexdigest(password + user.password_salt) != user.password_hash
      raise "Username or password invalid"
    end
    return user
  end

  def password=(pass)
    salt = [Array.new(6){ rand(256).chr}.join].pack("m").chomp
    self.password_salt, self.password_hash =
      salt, Digest::SHA256.hexdigest(pass + salt)
  end
end
