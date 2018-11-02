class GossipsController < ApplicationController

  def index
    @gossip = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end
=begin
  def create
    @gossip = Gossip.create(title: params["gossip"]["title"], content: params["gossip"]["content"])
    redirect_to @gossip
  end
=end

  def create
    @gossip = Gossip.new(gossip_params)
    if logged_in?
      @gossip.save
      redirect_to @gossip
    else
      flash.now[:alert] = "You must be logged in !"
      redirect_to '/'
    end
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
    gossip_params = params.require(:gossip).permit(:title,:content)
    @gossip.update(gossip_params)
    redirect_to @gossip
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.delete
    redirect_to gossips_path
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end
