class CommentsController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    p @story.story_comments
    @story_comment = @story.story_comments.new(params[:story_comment])
    p @story.story_comments
    @story_comment.user = current_user
    if @story_comment.save
      redirect_to story_path(@story), :notice => "Comment added"
    else
      render 'stories/show'
    end
  end

  def destroy
  end

  def index
    # Возможно сделать этот редирект по-другому?
    @story = Story.find(params[:story_id])
    redirect_to story_path(@story)
  end
end
