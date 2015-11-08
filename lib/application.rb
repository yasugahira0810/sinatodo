require 'sinatra/base'

module Sinatodo

	class Application < Sinatra::Base

		get '/' do
			'sinatodo application'
		end

	end
end
