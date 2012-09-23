class TrialsController < ApplicationController
  def new
  end

  def create
    @trial = current_user.trials.create(params[:trial])
    redirect_to @trial
  end

  def destroy
    Trial.find(params[:id]).destroy
    flash[:success] = "Trial deleted."
    redirect_to current_user 
  end

  def index
  end

  def show
    @trial = Trial.find(params[:id])
  end

end
