class Review < ActiveRecord::Base
  attr_accessible :body, :product_id, :rating, :product

  belongs_to :product

  validates_length_of :body, :minimum => 50, :maximum => 100
  validates_inclusion_of :price, :in => 0..5
end
