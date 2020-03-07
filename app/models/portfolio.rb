class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  # scopes - First method - a class method
  def self.angular

    where(subtitle: "Angular")
  end

  # scopes - method - a lambda 
  scope :ruby_on_rails_items, -> {where(subtitle: "Ruby on Rails")}
end
