class RelationshipsController < ApplicationController
	def create
		user = User.find(params[:user_id])

		relationship = Relationship.new(following_id: current_user.id, follower_id: user.id)
		relationship.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		user = User.find(params[:user_id])

		relationship = Relationship.find_by(following_id: current_user.id, follower_id: user.id)
		relationship.destroy
		redirect_back(fallback_location: root_path)
	end
end