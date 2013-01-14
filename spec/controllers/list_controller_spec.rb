require 'spec_helper'

describe ListsController do
  
  it "should update list" do
   l = List.create(:name => "list")
   put :update, { :id => l.id, :list => {:name => 'update',:records => "10"}}
   response.should redirect_to(l)  
  end
  
end  