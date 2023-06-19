require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do

  let(:first_user) { User.create(name: 'John', photo: 'img-one.jpg', bio: 'Artist from Kenya.') }
  let(:second_user) { User.create(name: 'Shayan', photo: 'img-two.jpg', bio: 'Artist from Pakistan.') }

    before do
      first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
      second_post = Post.create(author: second_user, title: 'World of tech', text: 'This is my second post')

      visit users_path
    end

    it 'Displays the username of all other users' do
      expect(page).to have-content('John')
      expect(page).to have-content('Shayan')
    end

    it 'Displays the profile picture for each user.' do
      expect(page).to have_css("img[src*='img-one.jpg']")
      expect(page).to have_css("img[src*='img-two.jpg']")
    end

    it 'Displays the number of posts each user has written.' do
      expect(page).to have_content(first_user.posts.counter)
      expect(page).to have_content(second_user.posts.counter)
    end  

    it 'redirects to user show page when clicking on a user' do
      click_link first_user.name
      expect(page).to have_current_path(user_path(first_user))

      click_link second_user.name
      expect(page).to have_current_path(user_path(second_user))

    end
end