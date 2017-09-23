class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @vote = @votable.votes.create(user: current_user)
  end

  def destroy
    @vote = @votable.votes.take.try(:destroy)
  end
end
