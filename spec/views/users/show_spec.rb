require 'rails_helper'

Rspec.describe 'User show page', type: :feature do

  let!(:user) { User.create(name: 'John', photo: 'img-one.jpg', bio: 'Artist from Kenya.') }
  let!(:first_post) { Post.create(author: user, title: 'Hello', text: 'This is my first post') }
  let!(:second_post) { Post.create(author: user, title: 'World of tech', text: 'This is my second post') }
  let!(:third_post) { Post.create(author: user, title: 'Coding is fun', text: 'This is my third post') }

  before do
    visit user_path(user)
  end

    it 'Displays the profile picture of the user.' do
      expect(page).to have_css("img[src*='img-one.jpg']")
    end

    it 'Displays the user username' do
      expect(page).to have_content('John')
    end

    it 'Displays the number of posts written by user' do
      expect(page).to have_content(user.posts_counter)
    end
    
    it 'Displays the bio of the user' do
      expect(page).to have_content('Artist from Kenya.')
    end

    it 'Displays the users first 3 posts.' do
      expect(page).to have_content("Hello")
      expect(page).to have_content("World of tech")
      expect(page).to have_content("Coding is fun")
    end

    it 'Shows a button that lets me view all of a users posts.' do
      expect(page).to have_link('See all posts', href: user_posts_path(user))
    end

    it 'redirects to the post show page when clicking on a post' do
      click_link 'Hello'
      expect(page).to have_current_path(post_path(first_post))

      # Go back to the user show page
      visit user_path(user) 
  
      click_link 'World of tech'
      expect(page).to have_current_path(post_path(second_post))

      visit user_path(user)
  
      click_link 'coding is fun'
      expect(page).to have_current_path(post_path(third_post))
    end

    it 'redirects to the user posts index page when clicking "View All Posts"' do
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(user))
    end
end

