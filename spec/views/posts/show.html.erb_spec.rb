require 'rails_helper'

RSpec.describe "posts/show.html.erb", type: :view do
    if Post.ID % 5 == 0
        Post.title = "SPAM"
    end
end
