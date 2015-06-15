require "rails_helper"

RSpec.describe Blog::BlobsController, type: :routing do
    describe 'routing' do
        it 'should route to #index' do
            expect(:get => '/blog/blobs').to route_to('blog/blobs#index')
        end
        
        it 'should route to #new' do
            expect(:get => '/blog/blobs/new').to route_to('blog/blobs#new')
        end
    end
end