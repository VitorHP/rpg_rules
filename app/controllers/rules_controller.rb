class RulesController < InheritedResources::Base
  respond_to :html, :json
  layout false

  protected

  def collection
    if params[:system_id]
      @rules = end_of_association_chain.joins(:book).where(books: {system_id: params[:system_id]})
    elsif params[:book_id]
      @rules = end_of_association_chain.where(book_id: params[:book_id])
    else
      @rules = end_of_association_chain.all
    end
  end
end
