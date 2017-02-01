class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show]
  def index
  end

  def new
    @exercise = current_user.exercises.new
  end

  def create
    @exercise = current_user.exercises.build(exercise_params)
    if @exercise.save
      redirect_to user_exercise_path(current_user, @exercise), notice: "Exercise has been created"
    else
      flash.now[:alert] = "Exercise has not been created"
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  private

    def exercise_params
      params.require(:exercise).permit(:workout_date, :workout, :duration_in_min)
    end

    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

end
