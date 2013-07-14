class SystemsController < InheritedResources::Base
  respond_to :html, :json
  layout false

  def index
    super do |format|
      format.json { render json: @systems.to_json( include: :books ) }
    end
  end

  def show
    super do |format|
      format.json { render json: @system.to_json( include: [ :books, :rules ] ) }
    end
  end

end
