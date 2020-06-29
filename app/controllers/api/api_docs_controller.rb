class Api::ApiDocsController < ApplicationController
    include Swagger::Blocks
    
    swagger_root do
        key :swagger, '2.0'
        info do
            key :version, '1.0.0'
            key :title, 'Excite Map API'
        end
        key :consumes, ['application/json']
        key :produces, ['application/json']
    end

    SWAGGERED_CLASSES = [
        Api::SpotsController,
        self,
    ].freeze

    def index
      render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
    end
 end