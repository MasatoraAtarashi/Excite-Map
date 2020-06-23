class Api::SpotCommentsController < ApplicationController
    protect_from_forgery

    def show
        @spot_comment = SpotComment.find(spot_id: params[:id], user_id: params[:user_id])
        @spot_comment = {
            id: @spot_comment.id,
            spot_id: @spot_comment.spot_id,
            author: User.find_by(id: @spot_comment.user_id),
            content: @spot_comment.content
        }
        render json: @spot_comment
    end

    def create
        @spot_comment = SpotComment.new(spot_comment_params)
        if @spot_comment.save
            spot_comment_json = {
                id: @spot_comment.id,
                spot_id: @spot_comment.spot_id,
                author: User.find_by(id: @spot_comment.user_id),
                content: @spot_comment.content
            }
            render json: spot_comment_json
        else
            render status: 400, json: { "message": "spot comment creation faild" }
        end
    end

    def update
        @spot_comment = SpotComment.find_by(spot_id: params[:id], user_id: params[:user_id])
        if @spot_comment.update(spot_comment_params)
            spot_comment_json = {
                id: @spot_comment.id,
                spot_id: @spot_comment.spot_id,
                author: User.find_by(id: @spot_comment.user_id),
                content: @spot_comment.content
            }
            render json: spot_comment_json
        else
            render status: 400, json: { "message": "spot comment updation faild" }
        end
    end

    def destroy
        SpotComment.find(spot_id: params[:id], user_id: params[:user_id]).destroy
    render json: { "message": "spot comment successfully removed" }
    end

    private
        def spot_comment_params
            params.require(:spot_comment).permit(:spot_id, :user_id, :content)
        end
  
end