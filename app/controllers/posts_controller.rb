class PostsController < ApplicationController
  def index
    @posts = Post.all.order('updated_at DESC')
    @meals = Meal.all.order('updated_at DESC')
  end

  def show
    @post = Post.find( params[:id] )
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "投稿が完了しました！"
      redirect_to :root
    else
      # flash.nowを使うシチュエーションは、リダイレクトをしない場合
      flash.now[:alert] = "投稿が失敗しました。"
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:name, :text, :image, :elevation, :walking_distance, :difficulty)
  end

end
