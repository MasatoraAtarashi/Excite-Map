class ApplicationController < ActionController::Base

  def hello
    render html: "unko"
  end
end
