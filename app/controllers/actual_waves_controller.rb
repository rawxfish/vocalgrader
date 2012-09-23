class ActualWavesController < ApplicationController
  def new
  end


  def create
    @trial = Trial.find(params[:actual_wave][:trial_id])
    params[:actual_wave].delete(:trial_id)
    @actual_wave = @trial.actual_waves.build(params[:actual_wave])
    if @actual_wave.save
      flash[:success] = "Music file add success!"
      redirect_to @trial
    else
      flash[:error] = "Error: file could not be added"
      redirect_to @trial

    end
  end

  def destroy
  end

  def upload

    @trial = Trial.find(params[:id])
    @actual_wave = @trial.actual_waves.build()

    File.open('internal_tools/recorded_song.wav', 'wb') do |f| 
      f.write(request.raw_post) 
    end

    @actual_wave.picture_from_url 'internal_tools/recorded_song.wav'
        if @actual_wave.save
      flash[:success] = "Music file add success!"
      redirect_to @trial
    else
      flash[:error] = "Error: file could not be added"
      redirect_to @trial

    end

  end

end
