class CommentsController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    @story_comment = @story.comments.new(params[:story_comment])
    @story_comment.user = current_user
    if @story_comment.save
      redirect_to story_path(@story), :notice => "Comment added"
    else
      render 'stories/show'
    end
  end

  def index
    # Возможно сделать этот редирект по-другому?
    @story = Story.find(params[:story_id])
    redirect_to story_path(@story)
  end
end
