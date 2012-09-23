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
    @trial = Trial.find(params[:trial_id])
    @attempt_id = params[:actual_id]

    @trial.generate_data(@attempt_id)
    file = File.open("output_data/#{@trial.expected_wave.id}-#{@attempt_id}", "r")
    @grades = Array.new
    @freq1 = Array.new
    @freq2 = Array.new
    @max_freq = 0;
    i = 0
    file.each_line do |line|
      if i < 4
        @grades[i] = line.to_f
      else
        stuff = line.split(" ")
        @freq1[i - 4] = stuff[0].to_f
        @freq2[i - 4] = stuff[1].to_f
      end
      i = i + 1
    end
    @max_freq = i - 4
    
  end
end
