require "rails_helper"

RSpec.describe Blog::BlobsController, type: :routing do
    describe 'routing' do
        it 'should route to #index' do
            expect(:get => '/blog/blobs').to route_to('blog/blobs#index')
        end
        
        it 'should route to #new' do
            expect(:get => '/blog/blobs/new').to route_to('blog/blobs#new')
        end
        
        it 'should route to #show' do
            expect(:get => '/blog/blobs/1').to route_to('blog/blobs#show', :id => '1')
        end
        
        it 'should route to #create' do
            expect(:post => '/blog/blobs/').to route_to('blog/blobs#create')
        end
        
        it 'should route to #edit' do
            expect(:get => '/blog/blobs/1/edit').to route_to('blog/blobs#edit', :id => '1')
        end
        
        it 'should route to #destroy' do
            expect(:delete => '/blog/blobs/1').to route_to('blog/blobs#destroy', :id => '1')
        end
    end
end