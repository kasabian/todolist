require 'spec_helper'

describe Record do
  it { should have_db_column(:check) }
  it { should have_db_column(:title) }
  it { should have_db_column(:priority) }
  it { should have_db_column(:list_id) }
  it { should belong_to(:list) }
  
  it "should not create record with title length 0" do 
    Record.create(:title => "")
    r = Record.all
    r.length.should eq 0 
  end
  
  it "should not create record with title length 51" do 
    c = "h"
    50.times {c+="h"}
    Record.create(:title => c)
    r = Record.all
    r.length.should eq 0 
  end
  
  it "should create record with title length in 1..50" do 
    Record.create(:title => "title")
    r = Record.all
    r.length.should eq 1 
  end
  
  
  it "should set priority with list " do 
    Record.create(:title => "title",:list_id => 1, :priority => 5)
    Record.create(:title => "title",:list_id => 1, :priority => 3)
    Record.set_priority 1
    r = Record.all
    r[0].priority.should == 1
    r[1].priority.should == 0
  end  
  
end
