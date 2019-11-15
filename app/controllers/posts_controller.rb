class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @all_ranks = Post.create_all_ranks
    @posts = Post.includes(:user, :likes, :comments, :meal).order('updated_at DESC')
    @users = User.order('updated_at DESC')
    @meals = Meal.includes(:post).order('updated_at DESC')
    if user_signed_in?
      @current_user_posts=Post.where(user_id:current_user.id).order('updated_at DESC')
      @posts = Post.includes(:user, :likes, :comments, :meal).where.not(user_id: current_user.id).order('updated_at DESC')
    end
  end

  def show
    @comments = @post.comments.last(5)
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @post.build_meal
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

  def edit
  end

  def update
    if @post.user_id == current_user.id
      if @post.update(post_params)
        flash[:success] = "編集が完了しました！"
        redirect_to :root
      else
        flash.now[:alert] = '商品の編集に失敗しました'
        render :edit
      end
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = '商品を削除しました'
      redirect_to :root
    else
      flash.now[:alert] = '商品の削除に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def notification
  end

  def usage
  end

  def notification
  end

  def ranking
    @all_ranks = Post.create_all_ranks
  end

  private
  def post_params
    params.require(:post).permit(
      :name,
      :text,
      :image,
      :elevation,
      :walking_distance,
      :difficulty,
      :remove_image,
      meal_attributes: [:id,
                        :name,
                        :image,
                        :cooking_time,
                        :food_stuff,
                        :cooking_method]
    ).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
