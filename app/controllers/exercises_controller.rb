class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  def index
    @exercises = current_user.exercises
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
    if @exercise.update(exercise_params)
      redirect_to [current_user, @exercise], notice: "Exercise has been updated"
    else
      flash.now[:alert] = "Exercise has not been updated"
      render 'edit'
    end
  end

  def destroy
    @exercise.delete
    redirect_to user_exercises_path(current_user), notice: "Exercise has been deleted"
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
