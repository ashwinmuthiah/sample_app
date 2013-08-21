Given /^the user has an account$/ do
	@user = User.create(name: "Example User", email: "user1@example.com", 
		password: "foofoofoo", password_confirmation: "foofoofoo")
end

When /^the user visits the signin page$/ do
	visit signin_path
end

When /^he submits valid signin information$/ do
	fill_in "Email", with: @user.email
	fill_in "Password", with: @user.password
	click_button "Sign in"
end

Given /^a user visits the signin page$/ do
	visit signin_path
end

When /^he submits invalid signin information$/ do
	click_button "Sign in"
end

Then /^he should see an error message$/ do
	expect(page).to have_selector('div.alert.alert-error')
end

When /^the user submits valid signin information$/ do
	fill_in "Email", with: @user.email
	fill_in "Password", with: @user.password
	click_button "Sign in"
end

Then /^he should see his profile page$/ do
	expect(page).to have_title(@user.name)
end

Then /^he should see a signout link$/ do
	expect(page).to have_link('Sign out', href: signout_path)
end

And /^he visits the signin page$/ do
	visit signin_path
end

And /^he submits valid signin information$/ do
	fill_in "Email", with: @user.email
	fill_in "Password", with: @user.password
	click_button "Sign in"
end

When /^a user visits the edit profile page$/ do
	visit edit_user_path(@user)
end

Then /^he should see a settings link$/ do
	expect(page).to have_link("Setting", href: edit_user_path(@user))
end

Given /^the user is logged in$/ do
  step 'the user has an account'
  step 'the user visits the signin page'
  step 'he submits valid signin information'
end
