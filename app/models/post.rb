class Post < ActiveRecord::Base
  attr_accessible :category_id, :content, :name, :title

  belongs_to :category
end
