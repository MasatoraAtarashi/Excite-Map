class Api::LikesController < Api::ApplicationController
    protect_from_forgery
    before_action :authenticate_user!

    def create
        @like = current_user.likes.create(spot_id: params[:spot_id])
        render json: @like
    end

    def destroy
        like = Like.find_by(user_id: current_user.id, spot_id: params[:spot_id])
        like.destroy
    end
end
