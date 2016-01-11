class UpVotesController < ApplicationController

  def create
    @up_vote = current_user.up_votes.new(vote_params)

    authorize @up_vote
    @up_vote.save ? flash[:success] = 'vote created' : flash[:danger] = 'Could not create Vote'
    redirect_to @up_vote.votable
  end

  private

  def vote_params
    params[:up_vote].permit(:votable_type, :votable_id)
  end
end
