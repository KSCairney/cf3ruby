require 'rails_helper'
    
describe ProductsController, type: :controller do
    before do
        @user = FactoryGirl.create(:user)
        @admin = FactoryGirl.create(:admin)
        @product = FactoryGirl.create(:product)
    end
    
    describe 'GET #index' do
        context 'When accessing the product index' do
            before do
                get :index
            end
        
            it 'Responds with 200 HTTP Status Code' do
                expect(response).to have_http_status(200)
            end
        end
    end
    
    describe 'GET #show' do
        context 'When a certain producti is selected' do
            it 'shows the bike details' do
                get :show, params: { id: @product }
            end
        end
    end
    
    describe 'GET #new' do
        context 'When a user wants to add a product' do
            it 'shows the new product form' do
                get :new
            end
        end
    end
    
    describe 'POST #create' do
        context 'When a product is created' do
            it 'saves the product to the database' do
                post :create, params: { product: {name: "Test 2", description: "a bike", color: "clear", price: "20.17" } }
                expect(response.status).to eq 302
            end
        end
        
        context 'When product creation fails' do
            it 'is not saved to the database' do
                post :create, params: {product: {name: ""}}
                expect(response.status).to eq 200
            end
        end
    end
    
    describe 'PATCH #update' do
        context 'when a bike is updated' do
            it 'updates the product in the database' do
                patch :update, params: { id: @product, product: { price: "20.18"} }
                expect(response.status).to eq 302
            end
        end
    end
    
    describe 'DELETE #destroy' do
        context 'when a product is destroyed' do
            it 'removes the product from the database' do
                delete :destroy, params: {id: @product}
                expect(response.status).to eq 302
            end
        end
    end
    
end