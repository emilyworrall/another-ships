require 'sinatra/base'

class Another_ships < Sinatra::Base
  set :views, proc {File.join(root,'..','/views')}
  get '/' do
    erb :index
  end

  get '/new_player' do
    @name = params[:name]
    session[:name] = params[:name]
    erb :new_player
  end

  get '/new_game' do
    @name = params[:name]
    erb :new_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
