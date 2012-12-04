require 'spec_helper'

describe PagesController do

  describe 'GET index' do
    it 'should return the list of the Page' do
      # Stub the method :all from Page to return an array with one Page
      page = stub_model(Page)
      Page.stub(:all) { [page] }

      get :index
      expect(assigns(:pages)).to eq([page])
    end
  end

  describe 'POST create' do

    it 'should render the index with object error if the page is not valid' do
      post :create, 'page' => { 'fb_id' => '00000000000' }
      response.should be_success #not a redirect

      expect(assigns(:new_page)).to have(1).errors_on(:fb_id)
    end

    it 'should redirect to the index if the page is valid' do
      post :create, 'page' => { 'fb_id' => '188091757763' }
      response.should redirect_to root_path

      expect(assigns(:new_page)).to be_persisted
    end

  end

end
