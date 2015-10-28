class PhotoApiController < ApplicationController

	def connect
		redirect_to Instagram.authorize_url(:redirect_uri => callback_url)
	end

	def callback
		#response = Instagram.get_acces_token(params[:code], :redirect_uri => CALLBACK_url)
		#session[:acces_token]=response.acces_token
	end
end
