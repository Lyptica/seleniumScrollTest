require 'selenium-webdriver'

class GetScrollLength
	@@firefox = nil

	def initialize()
		#ブラウザのセットアップ
		@@firefox = Selenium::WebDriver.for :firefox
		@@firefox.manage.timeouts.implicit_wait = 10 #要素が見つけられなくても最大で10秒待つ
		@@firefox.manage.window.resize_to(320, 480)

		#ページの長さを取得
		pageUrl = 'https://ja.wikipedia.org/wiki/アンパンマンの登場人物一覧'
		@@firefox.navigate.to pageUrl
		pageLength = @@firefox.execute_script("return document.body.scrollHeight")
		p "ページの縦の長さ: #{pageLength}"

		#イベント駆動
		if pageLength > 100000 then
			p "長いページです。"
		elsif pageLength > 3000 then
			p "普通の長さのページです。"
		else
			p "短いページです。"
		end

		# 終了処理
		@@firefox.quit
	end
end
GetScrollLength.new()