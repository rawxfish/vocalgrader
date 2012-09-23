class ActualWavesController < ApplicationController

  def create
    @trial = Trial.find(params[:actual_wave][:trial_id])
    params[:actual_wave].delete(:trial_id)
    @actual_wave = @trial.actual_waves.build(params[:actual_wave])
    if @actual_wave.save
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
