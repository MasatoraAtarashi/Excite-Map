class StaticPagesController < ApplicationController
  def home
    redirect_to 'https://excite-map.unicornplatform.com/'
  end
end
