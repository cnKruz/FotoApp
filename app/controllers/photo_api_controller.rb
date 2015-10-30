class PhotoApiController < ApplicationController

	def connect
		redirect_to Instagram.authorize_url(:redirect_uri => callback_url)
	end

	def callback
		if(params.has_key?(:code))
			response = Instagram.get_access_token(params[:code], :redirect_uri => callback_url)
			session[:acces_token]=response.access_token
			redirect_to navigation_url
		elsif (params.has_key?(:error))
			@message = "No Authorization Error."
		else 
			@message = "Authorization has Expired, please log in again."
		end

	end

	def navigation
		
	end


end
