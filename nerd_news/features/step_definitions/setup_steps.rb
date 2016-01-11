Given(/^i am an authenticated user$/) do
@user = build(:user)

visit "/users/sign_in"
click_link "Sign up"
 fill_in "Email", :with => @user.email
 fill_in "Password", :with => @user.password
  fill_in "Password confirmation", :with => @user.password
 click_button "Sign up"

end

Then (/^i see my email appear as logged in on the navbar$/) do
visit root_path
expect(page).to have_content("Signed in as #{@user.email}")
end


Then (/^i should be able to create a new post$/) do
visit root_path
click_link "Add New Post"
fill_in 'Url', with: 'a url'
fill_in 'Headline', with: 'a headline'
fill_in 'Description', with: 'Description'
click_button 'Create Post'

expect(page).to have_content("Created Post")
end
