class TrialsController < ApplicationController
  def new
  end

  def create
    @trial = current_user.trials.build(params[:trial])
    if @trial.save
      flash[:success] = "New Trial Created!"
      redirect_to @trial 
    else
      flash[:error] = "Trial Creation Error"
      redirect_to root_path
    end
  end

  def destroy
    Trial.find(params[:id]).destroy
    flash[:success] = "Trial deleted."
    redirect_to root_path 
  end

  def show
    @trial = Trial.find(params[:id])
  end 
  
  def judge
    
  end

end
