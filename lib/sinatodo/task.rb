require 'active_record'

module Sinatodo

	# tasksテーブルを表現するモデルクラス
	# @author yasugahiray
	class Task < ActiveRecord::Base

		# あえてメソッドではなくscopeという機能を使っている。
		# こうすることでメソッドチェインを行うことをより強調できる。
		scope :status_is, ->(status) { where(status: status) }

		scope :status_is_not_yet, -> { status_is(NOT_YET) }
		scope :status_is_pending, -> { status_is(PENDING) }
		scope :status_is_done, -> { status_is(DONE) }

		NOT_YET = 0
		DONE = 1
		PENDING = 2

		STATUS = {
			'NOT_YET' => NOT_YET,
			'DONE' => DONE,
			'PENDING' => PENDING
		}.freeze
		
		validates :name, presence: true, length: {maximum: 140}
		validates :content, presence: true
		validates :status, numericality: true, inclusion: {in: STATUS.values}
		def status_name
			STATUS.key(self.status)
		end

	end

end
