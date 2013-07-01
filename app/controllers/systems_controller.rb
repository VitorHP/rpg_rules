class SystemsController < InheritedResources::Base
  respond_to :json

  def index
    super do |format|
      format.json { render json: @systems.to_json( include: :books ) }
    end
  end
end
