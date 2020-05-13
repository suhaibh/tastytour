class DiningExperiencesController < ApplicationController
  def show
    @dining_experience = DiningExperience.find(params[:id])
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
