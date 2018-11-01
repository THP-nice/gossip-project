class CommentsController < ApplicationController

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.gossip_id = params[:gossip_id]
    @comment.save
    redirect_to gossip_path(@comment.gossip)
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to gossip_path(@comment.gossip)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to gossips_path(@comment.gossip)
  end

  def comment_params
    params.require(:comment).permit(:anonymous_commentor, :content)
  end

end
