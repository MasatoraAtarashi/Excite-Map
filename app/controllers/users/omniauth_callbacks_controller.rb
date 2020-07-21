# frozen_string_literal: true

class Users::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
  include DeviseTokenAuth::Concerns::SetUserByToken
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  def redirect_callbacks
    super
  end

  def omniauth_success
    super
    update_auth_header
  end

  def omniauth_failure
    super
  end

  def get_resource_from_auth_hash
    super
     # @resource.credentials = auth_hash["credentials"]
    clean_resource
  end

  def render_data_or_redirect(message, data, user_data = {})
    if Rails.env.production?
      if ['inAppBrowser', 'newWindow'].include?(omniauth_window_type)
        render_data(message, user_data.merge(data))
      elsif auth_origin_url
        redirect_to DeviseTokenAuth::Url.generate(auth_origin_url, data.merge(blank: true))
      else
        fallback_render data[:error] || 'An error occurred'
      end
    else
      # @resource.credentials = auth_hash["credentials"]

      # わかりやすい様に開発時はjsonとして結果を返す
      render json: @resource, status: :ok
    end
  end

  def clean_resource
    # @resource.name = strip_emoji(@resource.name)
    # @resource.nickname = strip_emoji(@resource.nickname)
  end

  def strip_emoji(str)
    # str.encode('SJIS', 'UTF-8', invalid: :replace, undef: :replace, replace: '').encode('UTF-8')
  end

end
  # You should also create an action method in this controller like this:
  # def twitter
  #   callback_from :twitter
  # end

  # private
  # def callback_from(provider)
  #   provider = provider.to_s

  #   @user = User.find_for_oauth(request.env['omniauth.auth'])

  #   if @user.persisted?
  #     flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
  #     render json: @user, event: :authentication

  #   else
  #     session["devise.#{provider}_data"] = request.env['omniauth.auth']
  #     render @user
  #   end
  # end
