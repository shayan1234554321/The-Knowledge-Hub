class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id_id'
  has_many :comments, foreign_key: 'post_id_id', class_name: 'Comment'
  has_many :likes, foreign_key: 'post_id_id', class_name: 'Like'

  after_save :update_posts_counter

  def update_posts_counter
    author.update(posts_counter: author.posts_counter + 1)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
