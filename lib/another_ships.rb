require 'sinatra/base'

class Another_ships < Sinatra::Base
  set :views, proc {File.join(root,'..','/views')}
  get '/' do
    erb :index
  end

  get '/new_player' do
    erb :new_player
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
