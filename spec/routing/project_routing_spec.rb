require "rails_helper"

RSpec.describe ProjectController, type: :routing do
    describe "routing" do
        it "routes to #index" do
            expect(:get => "/project").to route_to("project#index")
        end
        
        it "routes to #new" do
            expect(:get => "/project/new").to route_to("project#new")
        end
        
        it "routes to #show" do
            expect(:get => "/project/1").to route_to("project#show", :id => "1")
        end
        
        it "routes to #edit" do
            expect(:get => "/project/1/edit").to route_to("project#edit", :id => "1")
        end
        it "routes to #create" do
            expect(:post => "/project").to route_to("project#create")
        end
        
        it "routes to #update" do
            expect(:put => "/project/1").to route_to("project#update", :id => "1")
        end
        it "routes to #destroy" do
            expect(:delete => "/project/1").to route_to("project#destroy", :id => "1")
        end
    end
end