class ActorsController < ApplicationController
  skip_before_action :require_authenticated_user, only: %i[index show]

  def index
    @actors = Actor.all
  end

  def new
    @actor = Actor.new
  end

  def create
    # Remember to add flash message display in users/new view
    if (actor = Actor.create(actor_params))
      redirect_to actor_path(actor)
    else
      render 'new'
    end
  end

  def edit
    # Find what params looks like to figure out how to locate the actor
  end

  def update
    # Find what params looks like to figure out how to locate the actor
  end

  def destroy
    # Find what params looks like to figure out how to locate the actor
  end

  private

  def actor_params
    params.require(:actor).permit(:name)
  end
end
