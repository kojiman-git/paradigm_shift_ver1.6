class SearchController < ApplicationController
  def post_search
    @feed_all = Post.all
  end
end
