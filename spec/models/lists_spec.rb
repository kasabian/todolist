require 'spec_helper'

describe List do
  it { should have_db_column(:name) }
  it { should have_many(:records) }
  it { should belong_to(:user) }
  
  it "should not create record with name length 0" do 
    List.create(:name => "")
    l = List.all
    l.length.should eq 0 
  end
  
  it "should not create record with name length 51" do 
    c = "h"
    50.times {c+="h"}
    List.create(:name => c)
    l = List.all
    l.length.should eq 0 
  end
  
  it "should create record with name length in 1..50" do 
    List.create(:name => "title")
    l = List.all
    l.length.should eq 1 
  end
   
end
