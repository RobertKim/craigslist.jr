require 'SecureRandom'

class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :category

  def make_secure_hex
    self.secure_hex = SecureRandom.base64
  end

end
