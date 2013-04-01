class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(params[:comment])
    @comment.post = @post
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(@post), notice: 'Successfully created comment.' }
        format.js { }
      end
    else
      respond_to do |format|
        format.html { redirect_to post_path(@post), alert: 'Can not create comment.' }
        format.js { render text: "alert('Can not create comment.');" }
      end
    end
  end
end