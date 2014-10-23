class Property < ActiveRecord::Base
  attr_accessible :address, :property_type

  validates :address, :property_type, presence: true
end
