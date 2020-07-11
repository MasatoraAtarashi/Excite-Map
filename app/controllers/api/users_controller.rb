class Api::UsersController < Api::ApplicationController
    include Swagger::Blocks
    protect_from_forgery

    before_action :authenticate_user!, only: [:show, :update, :user_spots_count_each_mood]
    before_action :correct_user, only: [:show, :update, :user_spots_count_each_mood]


    def index
        @users = User.all
        render json: @users
    end

    def show
        @spots = @user.spots
        json = {
            user: @user,
            spots: @spots
        }
        render json: json
    end

    def update
        if @user.update(user_params)
            render json: @user
        end
    end

    # def update_image
    #     @user = User.find(params[:picture])

    # end
    
    def user_spots_count_each_mood
        ochitsuku_count = Spot.ochitsuku(@user.spots).length
        tanoshi_count = Spot.tanoshi(@user.spots).length
        shiawase_count = Spot.shiawase(@user.spots).length
        yaruki_count = Spot.yaruki(@user.spots).length
        fuman_count = Spot.fuman(@user.spots).length
        zetsubou_count = Spot.zetsubou(@user.spots).length
        json = {
            ochitsuku_count:  ochitsuku_count,
            tanoshi_count: tanoshi_count,
            shiawase_count: shiawase_count,
            yaruki_count: yaruki_count,
            fuman_count: fuman_count,
            zetsubou_count: zetsubou_count
        }
        render json: json
    end

    private
      def user_params
        params.require(:user).permit(:email, :username)
      end

      def correct_user
        @user = User.find(params[:id])
        if @user != current_user
            raise ApiError::UnauthorizedError.new(messages: ["認証エラー"])
        end
      end
end
