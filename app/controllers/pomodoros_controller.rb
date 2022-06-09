class PomodorosController < ApplicationController
  def index
    @pomodoros = Pomodoro.all
  end
end
