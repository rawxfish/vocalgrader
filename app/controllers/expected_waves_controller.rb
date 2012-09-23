class ExpectedWavesController < ApplicationController

  def create
    @trial = Trial.find(params[:expected_wave][:trial_id])
    params[:expected_wave].delete(:trial_id)
    @expected_wave = @trial.build_expected_wave(params[:expected_wave])
    if @expected_wave.save
      flash[:success] = "Music file add success!"
      redirect_to @trial
    else
      flash[:error] = "Error: file could be added"
      redirect_to @trial

    end
  end

  def destroy
  end

end
