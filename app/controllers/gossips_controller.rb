class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create(title: params["gossip"]["title"], content: params["gossip"]["content"], anonymous_gossiper: params["gossip"]["anonymous_gossiper"])
    redirect_to @gossip
  end

  def show
    @gossip = Gossip.find(params[:id])
  end
end
