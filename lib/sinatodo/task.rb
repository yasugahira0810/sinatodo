require 'active_record'

module Sinatodo

	# tasksテーブルを表現するモデルクラス
	# @author yasugahiray
	class Task < ActiveRecord::Base

		# あえてメソッドではなくscopeという機能を使っている。
		# こうすることでメソッドチェインを行うことをより強調できる。
		scope :status_is, ->(status){ where(status: status) }

		NOT_YET = 0
		DONE = 1
		PENDING = 2

		STATUS = {
			'NOT_YET' => NOT_YET,
			'DONE' => DONE,
			'PENDING' => PENDING
		}.freeze
	end
end
