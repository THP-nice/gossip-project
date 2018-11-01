class GossipsController < ApplicationController

  def index
    @gossip = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create(title: params["gossip"]["title"], content: params["gossip"]["content"], anonymous_gossiper: params["gossip"]["anonymous_gossiper"])
    redirect_to @gossip
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new
    @comment.gossip_id = @gossip.id
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title,:content,:anonymous_gossiper)
    @gossip.update(gossip_params)
    redirect_to @gossip
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.delete
    redirect_to gossips_path
  end

end
