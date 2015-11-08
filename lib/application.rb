require 'sinatra/base'
require 'haml'
require 'sinatodo/db'
require 'sinatodo/task'

module Sinatodo

	class Application < Sinatra::Base

		configure do
			DB.prepare
		end

		configure :development do
			require 'sinatra/reloader'
			register Sinatra::Reloader
		end

		get '/' do
			redirect '/tasks'
		end

		get '/tasks' do
			@tasks = Task.all
			
			haml :index
		end

	end
end
