# frozen_string_literal: true

require "time"

class Gig < ApplicationRecord
  validates :user_id, :venue_id, :title, :date, :start_time, :starts_at, presence: true

  belongs_to :user
  belongs_to :region
  belongs_to :venue

  has_many :gig_musician_memberships, dependent: :destroy
  has_many :musicians, through: :gig_musician_memberships

  before_validation :set_start_related, if: -> { start_time_has_changed? }

  before_save :touch_users_gigs_last_updated_at

  scope :upcoming, -> { where("start_time >= ?", Time.zone.now - 4.hours) }

  private

  def touch_users_gigs_last_updated_at
    user.update!(gigs_last_updated_at: Time.zone.now)
  end

  def set_start_related
    set_starts_at
    set_reminder_at
  end

  def set_starts_at
    starts_at_time = Time.parse(start_time)
    self.starts_at = date + starts_at_time.hour.hours + starts_at_time.min.minutes
  end

  def set_reminder_at
    return unless hours_before_reminder.present?

    self.reminder_at = starts_at - hours_before_reminder.hours
  end

  def start_time_has_changed?
    date_changed? || start_time_changed?
  end
end
