class Blog < ApplicationRecord

  enum status: {draft: 0, published: 1}   #jx: Essential - 22 Feb 2020 

  extend FriendlyId
  friendly_id :title, use: :slugged
end
