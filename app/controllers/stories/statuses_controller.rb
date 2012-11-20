class Stories::StatusesController < ApplicationController
  def update
    @story = Story.find(params[:story_id])
    @story.status_event = params[:story][:status_event]
    redirect_to stories_path
  end
end
