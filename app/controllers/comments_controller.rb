class CommentsController < ApplicationController
  before_action :set_post,    only: [:new, :create, :show, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def show
    @comments = @post.comments.order('updated_at DESC')
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      flash[:success] = "コメントが完了しました！"
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = "失敗しました。"
        redirect_back(fallback_location: root_path)
    end
  end

  def edit
  end

  def update
    if @comment.user_id == current_user.id
      if @comment.update(comment_params)
        flash[:success] = "編集が完了しました！"
        redirect_to post_path(@post.id)
      end
    end
  end

  def destroy
    if @comment.destroy
      flash[:success] = 'コメントを削除しました'
      redirect_to post_path(@post.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id],post_id: params[:post_id])
  end
end
