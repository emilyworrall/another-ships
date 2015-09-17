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
    @battleship = Ship.battleship
    coords_2 = params[:coords_2].to_sym if params[:coords_2]
    orient_2 = params[:orient_2].to_sym if params[:orient_2]
    if coords_2 && orient_2
      @board.place(@battleship, coords_2, orient_2)
    end
    @destroyer = Ship.destroyer
    coords_3 = params[:coords_3].to_sym if params[:coords_3]
    orient_3 = params[:orient_3].to_sym if params[:orient_3]
    if coords_3 && orient_3
      @board.place(@destroyer, coords_3, orient_3)
    end
    @submarine = Ship.submarine
    coords_4 = params[:coords_4].to_sym if params[:coords_4]
    orient_4 = params[:orient_4].to_sym if params[:orient_4]
    if coords_4 && orient_4
      @board.place(@submarine, coords_4, orient_4)
    end
    @patrol_boat = Ship.patrol_boat
    coords_5 = params[:coords_5].to_sym if params[:coords_5]
    orient_5 = params[:orient_5].to_sym if params[:orient_5]
    if coords_5 && orient_5
      @board.place(@patrol_boat, coords_5, orient_5)
    end

    erb :new_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
