require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "GET #new" do
        it "renders the new template" do
            get :new, {}
            expect(response).to render_template("new")
        end
    end

    describe "POST #create" do
        context "with invalid params" do
            it "validates the presence of the users email and password" do
                post :create, params: { user: { username: "Augustus" } }

                expect(response).to render_template("new")
                expect(flash[:errors]).to be_present
            end
        end

        context "with valid params" do
            it "redirects to the user show page" do
                post :create, params: { user: { username: "Augustus",
                                                email: "augustus@example.com",
                                                password: "password" } }

                augustus = User.find_by(username: "Augustus")

                expect(response).to redirect_to(user_url(augustus))
            end
        end
    end
end
