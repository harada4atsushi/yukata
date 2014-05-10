class Woman < ActiveRecord::Base
  has_many :themes
  accepts_nested_attributes_for :themes

  #validates :name, :presence => true
end
