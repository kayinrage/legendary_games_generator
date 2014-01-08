class GeneratorController < ApplicationController

  def show
  end

  def create
    @games = Generator.new(params[:generator][:number_of_players].to_i, params[:generator][:number_of_games].to_i).generate
    render :show
  end

end
