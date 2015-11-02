class PhotoApiController < ApplicationController
	layout "main", :only => [:connect, :callback]
	before_action :set_client

	def connect
		redirect_to Instagram.authorize_url(:redirect_uri => callback_url)
	end

	def callback
		if(params.has_key?(:code))
			response = Instagram.get_access_token(params[:code], :redirect_uri => callback_url)
			session[:access_token]=response.access_token
			redirect_to navigation_url
		elsif (params.has_key?(:error))
			@message = "No Authorization Error."
		else 
			@message = "Authorization has Expired, please log in again."
		end

	end

	def navigation
	end

	def recent_media
		@user=@client.user
	
	end

   	def feed

   	end
   	
   	def popular

   	end

   	private
   	def set_client
   		@client = Instagram.client(:access_token => session[:access_token])
   	end

end
