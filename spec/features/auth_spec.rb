require 'rails_helper'

feature "the signup process" do
    scenario "has a new user page" do
        visit new_user_url
        expect(page).to have_content "Sign Up"
    end

    feature "signing up a user" do
        before(:each) do
            visit new_user_url
            fill_in "Username", with: "Julius"
            fill_in "Email", with: "julius@example.com"
            fill_in "Password", with: "Password"
            click_on "Signup"
        end

        scenario "redirects to user show page after signup" do
            expect(page).to have_content "julius@example.com"
        end
    end
end