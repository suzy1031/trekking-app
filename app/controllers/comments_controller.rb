class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def show
    @post = Post.find( params[:id] )
    @comments = @post.comments.order('updated_at DESC')
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(comment_params)
    if @comment.save
      flash[:success] = "コメントが完了しました！"
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = "失敗しました。"
        redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
