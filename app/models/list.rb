class List < ActiveRecord::Base
  attr_accessible :name
  validates :name, :length => { :in => 1..50}  
  has_many :records
  
end