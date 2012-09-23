class TrialsController < ApplicationController
  def new
  end

  def create
    @trial = current_user.trials.create(params[:trial])
    redirect_to @trial
  end

  def destroy
  end

  def index
  end

  def show
    @trial = Trial.find(params[:id])
    @expected_wave = @trial.build_expected_wave
  end

end
