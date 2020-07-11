class Api::ApplicationController < ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken 
    class ApiError < StandardError
        attr_reader :status, :messages

        def initialize(status: 400, messages: [])
            @status = status
            @messages = messages
        end

        class UnauthorizedError < ApiError
            def initialize(messages: [])
                super(status: 401, messages: messages)
            end
        end
    end

    rescue_from ApiError, with: :render_error

    def render_error(e)
        render json: {
            messages: e.messages,
            status: e.status
        }
    end
end