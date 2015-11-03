require 'optparse'

module Sinatodo
	class Command
		module Options

			def self.parse!(argv)
				options = {}

				# サブコマンドなどのOptionParserを定義
				sub_command_parsers = create_sub_command_parsers
				cummand_parser = create_command_parser

				# 引数の解析を行う(解析できない文字列(=サブコマンド)に会うまで処理を続ける)
				begin
					command_parser.order!(argv)

					options[:command] = argv.shift

					sub_command_parsers[options[:command]].parse!(argv)
				rescue OptionParser::MissingArgument, OptionParser::InvalidOption, ArgumentError => e
					abort e.message
				end

				options

			end

			def self.create_sub_command_parsers
  			# サブコマンドの処理をする際に、未定義のkeyを指定されたら例外を発生させる
  			sub_command_parsers = Hash.new do |k, v|
  				raise ArgumentError, "'#{v}' is not sinatodo sub command."
  			end
		
				# サブコマンド用の定義 
				sub_command_parsers['create'] = OptionParser.new do |opt|
					opt.on('-n VAL', '--name=VAL', 'task name') { |v| options[:name] = v }
					opt.on('-c VAL', '--content=VAL', 'task content') { |v| options[:content] = v }
				end
			end

			def self.create_command_parser
				# サブコマンド以外の引数の定義
				OptionParser.new do |opt|
					opt.on_head('-v', '--version', 'Show program version') do |v|
						opt.version = Sinatodo::VERSION
						puts opt.ver
						exit
					end
				end
				
		end

	end

end
