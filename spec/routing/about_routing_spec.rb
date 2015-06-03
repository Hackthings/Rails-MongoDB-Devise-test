require "rails_helper"

RSpec.describe AboutController, type: :routing do
    describe "routing" do
        it "routes to #index" do
            expect(:get => '/about').to route_to("about#index")
        end
    end
end