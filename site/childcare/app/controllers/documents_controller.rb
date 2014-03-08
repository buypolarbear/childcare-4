class DocumentsController < ApplicationController
	# only signed-in users can use the edit or update actions
	before_action :signed_in_user

  def new
	@document = Document.new
  end

  def create
	@document = Document.new(document_params)
    if @document.save
	  flash[:success] = "Document creation successful"
      redirect_to @document
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
	@document = Document.find(params[:id])
  end

  def index
	@documents = Document.all
  end

  def destroy
  end
  
  private

    def document_params
      params.require(:document).permit(:path, :category, :title, :path,
                                   :expiration, :user_id)
    end
end
