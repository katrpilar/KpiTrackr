require 'rails_helper'
require 'support/controller_macros' # or require_relative './controller_macros' if write in `spec/support/devise.rb`


RSpec.describe CompaniesController, type: :controller do
  login_user
  render_views
  

  # it "should have a current_user" do
  #   # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
  #   expect(subject.current_user).to_not eq(nil)
  # end

  # describe "GET a company page" do

  #   it "renders the company show template" do
  #     user = User.first
  #     company = Company.create(name: "testing company")
  #     user.company = company
  #     # get company_path(company)
  #     get :show
  #     expect(response).to render_template("show")
  #   end
  # end

  # it "should get index" do
  #   # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
  #   # the valid_session overrides the devise login. Remove the valid_session from your specs
  #   get 'index'
  #   response.should be_success
  # end

  describe "new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
      # expect(response.body).to eq ""
    end
    it "renders the companies/new template" do
      get :new
      expect(response).to render_template("companies/new")
      # expect(response.body).to eq ""
    end
  end

  describe "show/:id" do
    # it "renders the show template" do
    #   # companyID = Company.first.id
    #   get :show, id: 2
    #   expect(response).to render_template("show")
    #   # expect(response.body).to eq ""
    # end
    before(:each) do
      @company = create(:company, user: subject.current_user)
      @id = @company.id
      @name = @company.name
    end

    
    it "displays the companies name on the page" do
      # puts subject.current_user
      get :show, params: {id: @id}

      ## Capybara Options
      # visit company_path(company)
      # visit "/companies/#{id}"
      # expect(page.body).to include(name)
      # page.find('h2', text: name)
      # expect(page).to have_text(name)

      expect(response.body).to have_text(@name)
    end

    it "renders the companies/show template" do
      get :show, params: {id: @id}
      expect(response).to render_template("companies/show")
      # expect(response.body).to eq ""
    end
  end
end
