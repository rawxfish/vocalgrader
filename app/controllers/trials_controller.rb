class TrialsController < ApplicationController
  def new
  end

  def create
    @trial = current_user.trials.create
    @trial.build_expected_wave(:file => params[:trial][:file])
    redirect_to root_path
  end

  def destroy
  end

  def index
  end

  def show
  end

end
