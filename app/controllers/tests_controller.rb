class TestsController < ApplicationController
  def index
    render json: {teste: "aaaa"}
  end
end