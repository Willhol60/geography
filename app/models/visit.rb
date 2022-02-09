class Visit < ApplicationRecord
  belongs_to :country
  belongs_to :user
  has_many_attached :photos

  validates :date, :notes, presence: true
  validates :notes, length: { maximum: 30 }

  scope :latest, -> { order(date: :asc) }

  # callback methods
  after_create_commit :increment_trip_count
  after_destroy_commit :decrease_trip_count

  after_create_commit :resize_photos

  private

  def resize_photos
    return unless photos.attached?

    photos.map! do |photo|
      MiniMagick::Image.read(photo.download).resize("100x100")
    end
  end

  def increment_trip_count
    user.trip_count += 1
    user.save!
  end

  def decrease_trip_count
    user.trip_count -= 1
    user.save!
  end
end

# more validations (and then test)
