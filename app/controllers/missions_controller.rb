class MissionsController < ApplicationController
  before_action :mission_params, only: [:create, :update, :edit, :destroy]
  def index
  end

  def create
  end


  def destroy
  end

  def edit

  end

  def update

  end

  private

  def mission_params
    params.require(:mission).permit(:title)
  end
end
