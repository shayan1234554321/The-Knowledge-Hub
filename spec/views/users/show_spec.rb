require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  let!(:user) { User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Artist from Kenya.') }
  let!(:first_post) { Post.create(author: user, title: 'Hello', text: 'This is my first post') }
  let!(:second_post) { Post.create(author: user, title: 'World of tech', text: 'This is my second post') }
  let!(:third_post) { Post.create(author: user, title: 'Coding is fun', text: 'This is my third post') }

  before do
    visit user_path(user)
  end

  it 'Displays the profile picture of the user.' do
    expect(page).to have_css('img')
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
    expect(page).to have_content('Hello')
    expect(page).to have_content('World of tech')
    expect(page).to have_content('Coding is fun')
  end

  it 'Shows a button that lets me view all of a users posts.' do
    click_on 'See all posts'
    expect(page).to have_content('This is my first post')
    expect(page).to have_content('This is my second post')
    expect(page).to have_content('This is my third post')
end

it 'redirects to the post show page when clicking on a post' do
    click_on first_post.title
    expect(page).to have_content('This is my first post')
  end

  it 'redirects to the user posts index page when clicking "View All Posts"' do
    visit user_post_path(user.id , first_post.id)
    click_link 'Back to all the posts'
    expect(page).to have_current_path(user_posts_path(user.id))
  end
end
