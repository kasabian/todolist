class List < ActiveRecord::Base
  attr_accessible :name,:user_id
  validates :name, :length => { :in => 1..50}  
  has_many :records
  belongs_to :user
end