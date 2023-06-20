require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before do
    @first_user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Artist from Kenya.')
    @second_user = User.create(name: 'Shayan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Artist from Pakistan.')
    Post.create(author: @first_user, title: 'Hello', text: 'This is my first post')
    Post.create(author: @second_user, title: 'World of tech', text: 'This is my second post')
    visit users_path
  end

  it 'Displays the username of all other users' do
    expect(page).to have_content('John')
    expect(page).to have_content('Shayan')
  end

  it 'Displays the profile picture for each user.' do
    expect(page).to have_css('img')
  end

  it 'Displays the number of posts each user has written.' do
    expect(page).to have_content(@first_user.posts_counter)
    expect(page).to have_content(@second_user.posts_counter)
  end

  it 'redirects to user show page when clicking on a user' do
    visit user_path(@first_user)
    expect(page).to have_current_path(user_path(@first_user))

    visit user_path(@second_user)
    expect(page).to have_current_path(user_path(@second_user))
  end
end
