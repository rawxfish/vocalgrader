class ExpectedWavesController < ApplicationController

  def create
    @trial = Trial.find(params[:expected_wave][:trial_id])
    params[:expected_wave].delete(:trial_id)

    @expected_wave = @trial.expected_wave.build(params[:expected_wave])
    if @expected_wave.save
      flash[:success] = "Music File Add Success!"
      redirect_to @trial
    else
      flash.now[:error] = "Error: file could be added"
      render @trial
    end
  end

  def destroy
  end

end
