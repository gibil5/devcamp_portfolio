class Portfolio < ApplicationRecord

  has_many :technologies

  accepts_nested_attributes_for :technologies,
                                reject_if: lambda {|attrs| attrs['name'].blank?}

  validates_presence_of :title, :body, :main_image, :thumb_image

  # scopes - First method - a class method
  def self.angular

    where(subtitle: "Angular")
  end

  # scopes - method - a lambda
  scope :ruby_on_rails_items, -> {where(subtitle: "Ruby on Rails")}

  # When the new action is called
  after_initialize :set_defaults
  #after_create :set_defaults    # not the right spot to set defaults

  def set_defaults
    #self.main_image ||= "https://via.placeholder.com/600x200"
    #self.thumb_image ||= "https://via.placeholder.com/350x200"
    self.main_image ||= Placeholder.image_generator(height: 200, width: 600)
    self.thumb_image ||= Placeholder.image_generator(height: 200, width: 350)
  end

  # Double pipes - Shortcut for
  #if self.main_image == nil
  #  self.main_image = "https://via.placeholder.com/600x200"
  #end
end
