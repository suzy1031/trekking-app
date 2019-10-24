class RankingsController < ApplicationController
  def index
    @all_ranks = Post.create_all_ranks
  end

  def show
    @post = Post.find(params[:id])
  end
end
