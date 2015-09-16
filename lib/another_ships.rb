require 'sinatra/base'

class another_ships < Sinatra::Base
  get '/' do
    'Hello another_ships!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
