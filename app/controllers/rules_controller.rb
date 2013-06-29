class RulesController < ApplicationController
  respond_to :json

  def index
    respond_with Rule.all
  end
end
