require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe "#hello" do
    it "responds successfully" do
      get :hello
      expect(response).to be_successful
    end

  end
end
