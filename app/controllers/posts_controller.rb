class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).order('updated_at DESC')
    @meals = Meal.includes(:user).order('updated_at DESC')
    if user_signed_in?
        @current_user_posts=Post.where(user_id:current_user.id).order('updated_at DESC')
    end
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

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = '商品を削除しました'
      redirect_to :root
    else
      flash.now[:alert] = '商品の削除に失敗しました'
      render :show
    end
  end

  private
  def post_params
    params.require(:post).permit(
                                :name,
                                :text,
                                :image,
                                :elevation,
                                :walking_distance,
                                :difficulty
                              ).merge(user_id: current_user.id)
  end

end
