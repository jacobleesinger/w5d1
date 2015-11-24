class Goal < ActiveRecord::Base
  validates :title, :user_id, :status, :visibility, presence: true
  validates :status, inclusion: { in: %w(NEW COMPLETED) }
  validates :visibility, inclusion: { in: %w(PUBLIC PRIVATE) }

  belongs_to :user

  def username
    user.username
  end
end
