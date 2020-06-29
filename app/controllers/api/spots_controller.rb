class Api::SpotsController < ApplicationController
  include Swagger::Blocks

  protect_from_forgery

  swagger_path '/api/spots/{id}' do
    operation :get do
      key :description, 'Find a spot by ID'
      key :operationId, :find_spot_by_id

      parameter name: :id do
        key :in, :path
        key :description, 'Spot ID'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      response 200 do
        key :description, 'Spot'
        schema do
          key :'$ref', :Spot
        end
      end
    end
  end

  swagger_path '/api/spots' do
    operation :get do
      key :summary, 'All Spots'
      key :description, 'Returns all spots'
      key :operationId, 'findSpots'
      response 200 do
        key :description, 'spot response'
        schema do
          key :type, :array
          items do
            key :'$ref', :Spot
          end
        end
      end
    end

    operation :post do
      key :description, 'Creates a new spot'
      key :operationId, 'addSpot'
      response 200 do
        key :description, 'spot response'
        schema do
          key :'$ref', :Spot
        end
      end
    end
  end

  def index
    @spots = Spot.all
    @spots = @spots.map do |spot|
      {
        id: spot.id,
        title: spot.title,
        description: spot.description,
        mood: spot.mood,
        picture: spot.picture.url,
        latitude: spot.latitude,
        longitude: spot.longitude,
        is_excite_place: spot.is_excite_place,
        created_at: spot.created_at,
        updated_at: spot.updated_at,
        user: User.find_by(id: spot.user_id),
        comments: SpotComment.where(spot_id: spot.id)
      }
    end
    render json: @spots
  end

  def index_only_excite_places
    @excite_places = Spot.where(is_excite_place: true)
    @excite_places = @excite_places.map do |excite_place|
      {
        id: excite_place.id,
        title: excite_place.title,
        description: excite_place.description,
        mood: excite_place.mood,
        picture: excite_place.picture.url,
        latitude: excite_place.latitude,
        longitude: excite_place.longitude,
        is_excite_place: excite_place.is_excite_place,
        created_at: excite_place.created_at,
        updated_at: excite_place.updated_at,
        user: User.find_by(id: excite_place.user_id),
        comments: SpotComment.where(spot_id: excite_place.id)
      }
    end
    render json: @excite_places
  end

  def show
    @spot = Spot.find(params[:id])
    @spot = 
      {
        id: @spot.id,
        title: @spot.title,
        description: @spot.description,
        mood: @spot.mood,
        picture: @spot.picture.url,
        latitude: @spot.latitude,
        longitude: @spot.longitude,
        is_excite_place: @spot.is_excite_place,
        created_at: @spot.created_at,
        updated_at: @spot.updated_at,
        user: User.find_by(id: @spot.user_id),
        comments: SpotComment.where(spot_id: @spot.id)
      }
    render json: @spot
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      spot_json =
        {
          id: @spot.id,
          title: @spot.title,
          description: @spot.description,
          mood: @spot.mood,
          picture: @spot.picture.url,
          latitude: @spot.latitude,
          longitude: @spot.longitude,
          is_excite_place: @spot.is_excite_place,
          created_at: @spot.created_at,
          updated_at: @spot.updated_at,
          user: User.find_by(id: @spot.user_id),
          comments: SpotComment.where(spot_id: @spot.id)
        }
      render json: spot_json
    else
      render status: 400, json: { "message": "spot creation faild" }
    end
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      spot_json =
        {
          id: @spot.id,
          title: @spot.title,
          description: @spot.description,
          mood: @spot.mood,
          picture: @spot.picture.url,
          latitude: @spot.latitude,
          longitude: @spot.longitude,
          is_excite_place: @spot.is_excite_place,
          created_at: @spot.created_at,
          updated_at: @spot.updated_at,
          user: User.find_by(id: @spot.user_id),
          comments: SpotComment.where(spot_id: @spot.id)
        }
      render json: spot_json
    else
      render status: 400, json: { "message": "spot updation faild" }
    end
  end

  def destroy
    Spot.find(params[:id]).destroy
    render json: { "message": "spot successfully removed" }
  end

  private
    def spot_params
      params.require(:spot).permit(:id, :title, :description, :mood, :picture, :latitude, :longitude, :user_id, :is_excite_place)
    end
end
