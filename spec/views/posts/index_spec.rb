require 'rails_helper'

RSpec.describe 'Post Index Page', type: :feature do
  before do
    @user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Artist from Kenya.')
    @post = Post.create(author: @user, title: 'First post', text: 'This is my first post')
    5.times do |i|
      Comment.create(text: "This is comment ##{i}", author_id_id: @user.id, post_id_id: @post.id)
    end
    visit user_posts_path(@user.id)
  end

  it 'displays post text' do
    expect(page).to have_content('This is my first post')
  end

  it 'displays post title' do
    expect(page).to have_content('First post')
  end

  it 'displays number of comments' do
    expect(page).to have_content('Comments: 5')
  end

  it 'displays number of likes' do
    expect(page).to have_content('Likes: 0')
  end

  it 'displays username' do
    expect(page).to have_content(@user.name)
  end

  it 'displays number of posts' do
    expect(page).to have_content('Number of posts: 1')
  end

  it 'displays user photo' do
    expect(page).to have_css('img')
  end
end
