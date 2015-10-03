class PostsController < ApplicationController
  def index
    @posts = Post.all
    
  end
  
  def filter
    if Post.id % 5 == 0
        Post.title = "SPAM"
    end
  end
  def show
  end

  def new
  end

  def edit
  end
end
