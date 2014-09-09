env = ENV["RACK_ENV"] || "development"

DataMapper.setup(default, "postgres://localhost/nintendonut_#{env}")

require '.lib/link'

DataMapper.finalize
DataMapper.auto_upgrade!

require 'sinatra/base'

class Nintendonut < Sinatra::Base
  get '/' do
    'Hello Nintendonut!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
