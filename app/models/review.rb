class Review < ActiveRecord::Base
  attr_accessible :body, :product_id, :rating

  belongs_to :product

  # validates_inclusion_of :rating, :in => 0..5
  # validates :body, :length => { :in => 50..1000 }

  validates :rating, :inclusion => { :in => 0..5, :message => "%{value} is not a valid rating" }
  validates :body, :length => { :minimum => 50, :maximum => 1000, :too_short => "must have at least %{count} characters", :too_long => "%{count} characters is the maximum allowed" }

end
