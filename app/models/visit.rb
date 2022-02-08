class Visit < ApplicationRecord
  belongs_to :country
  has_many_attached :photos

  validates :date, :notes, presence: true

  # callback methods
  after_create_commit :resize_photos

  # after_create_commit :increment_leader_board_points
  # after_destroy_commit :subtract_leader_board_points
  # have a flash for 'you just added a new wish'

  def resize_photos
    return unless photos.attached?

    photos.map! do |photo|
      MiniMagick::Image.read(photo.download).resize("100x100")
    end
  end

  # def increment_leader_board_points
  #   increment(user.leader_board_points, 1)
  # end
end

# more validations (and then test)
