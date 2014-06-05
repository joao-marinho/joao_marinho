class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  belongs_to :group
  has_secure_password
  after_destroy :ensure_an_user_remains

  private
  def ensure_an_user_remains
    if User.count.zero?
      raise "Can't delete last user"
    end
  end
end
