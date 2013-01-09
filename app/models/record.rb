class Record < ActiveRecord::Base
  attr_accessible :check, :priority, :title, :list_id
  belongs_to :list
  
  def self.set_priority list_id
    records = Record.where("list_id = ?",list_id).order("priority ASC")
    l=0
    records.each do |record|
     record.priority = l
     record.save()
     l+=1
    end 
  end  
end
