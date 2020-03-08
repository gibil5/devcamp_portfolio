class Skill < ApplicationRecord

include Placeholder

  validates_presence_of :title, :percent_utilized

  # When the new action is called
  after_initialize :set_defaults

  def set_defaults
    #self.badge ||= "https://via.placeholder.com/250x250"
    self.badge ||= Placeholder.image_generator(height: 250, width: 250)
  end
end
