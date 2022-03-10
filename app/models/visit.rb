class Visit < Trip
  has_one_attached :photo, dependent: :destroy

  scope :latest, -> { order(date: :asc) }

  # callback methods
  after_create :increment_trip_count
  after_destroy :decrease_trip_count

  private

  def increment_trip_count
    user.trip_count += 1
    user.save!
  end

  def decrease_trip_count
    user.trip_count -= 1
    user.save!
  end
end
