class DownVotesController < ApplicationController

  def create
    @down_vote = current_user.down_votes.new(vote_params)

    authorize @down_vote
    @down_vote.save ? flash[:success] = 'vote created' : flash[:danger] = 'Could not create Vote'
    redirect_to @down_vote.votable
  end

  private

  def vote_params
    params[:down_vote].permit(:votable_type, :votable_id)
  end
end
