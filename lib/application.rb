require 'sinatra/base'
require 'haml'

module Sinatodo

	class Application < Sinatra::Base

		get '/' do
			haml :index
		end

	end
end
