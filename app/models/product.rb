class Product < ActiveRecord::Base
  attr_accessible :name, :price, :reviews

  

  has_many :reviews

end
