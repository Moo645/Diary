class StoriesController < ApplicationController
  before_action :sign_in?
  before_action :find_story, only: [:show, :edit, :update, :destroy]

  def index
    @stories = current_user.stories.all
  end

  def new
      @story = current_user.stories.new
  end

  def create
    @story = current_user.stories.new(story_params)
    if @story.save
    redirect_to stories_path, notice: 'you create a new story!'
    else
    flash.now[:notice] = "Something went wrong"
    render :new
    end
  end

  def show

  end
  
  
  def edit
  end

  def update
    if @story.update(story_params)
      redirect_to stories_path, notice: 'Story update!'
    else
      flash.now[:notice] = "Something went wrong"
      render :edit
    end
  end

  def destroy
    @story.destroy!
    redirect_to stories_path, notice: 'Story delete!'
  end
  
  private
  def sign_in?
    redirect_to root_path unless user_signed_in?
  end

  def find_story
    @story = current_user.stories.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :content)
  end

end
