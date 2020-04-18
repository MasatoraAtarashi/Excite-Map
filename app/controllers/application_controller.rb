class ApplicationController < ActionController::Base

  def hello
    render html: "hllo, world!"
  end
end
