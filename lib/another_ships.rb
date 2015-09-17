require 'sinatra/base'
require_relative '../game_setup'

class Another_ships < Sinatra::Base
  set :views, proc {File.join(root,'..','/views')}
  get '/' do
    erb :index
  end

  get '/new_player' do
    @name = params[:name]
    session[:name] = :name
    erb :new_player
  end

  get '/new_game' do
    @board = Board.new(Cell)
    @name = params[:name]
    @aircraft_carrier = Ship.aircraft_carrier
    coords_1 = params[:coords_1].to_sym if params[:coords_1]
    orient_1 = params[:orient_1].to_sym if params[:orient_1]
    if coords_1 && orient_1
      @board.place(@aircraft_carrier, coords_1, orient_1)
    end

    erb :new_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
