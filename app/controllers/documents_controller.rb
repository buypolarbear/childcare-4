class DocumentsController < ApplicationController
	# only signed-in users can use the edit or update actions
	before_action :signed_in_user

	
  #############################################
  # 
  ##############################################
  def new
	@document = Document.new
  end

  
  #############################################
  # 
  ##############################################
  def create
	@document = Document.new(document_params)
    if @document.save
	  flash[:success] = "Document creation successful"
      redirect_to @document
    else
      render 'new'
    end
  end

  
  #############################################
  # 
  ##############################################
  def edit
	@document = Document.find(params[:id])
  end

  def update
	@document = Document.find(params[:id])
	if @document.update_attributes(document_params)
      flash[:success] = "Document updated"
      redirect_to @document
    else
      render 'edit'
    end
  end

  
  #############################################
  # 
  ##############################################
  def show
	@document = Document.find(params[:id])
  end
  
  
  def download
	@document = Document.find(params[:id])
	
	document_path = @document.path.url.gsub('/','\\')
	
    send_file @document.path.url, :type => "#{@document.path.content_type}", :filename => "#{@document.title} + #{@document.path.file.extension}"
  end

  
  #############################################
  # 
  ##############################################
  def index
	@documents = Document.all
  end

  
  #############################################
  # 
  ##############################################
  def destroy
	@document = Document.find(params[:id])
	if @document.destroy
		flash[:success] = "Document deleted."
	else
		flash[:error] = "There was a problem deleting this document."
	end
		
    redirect_to documents_url
  end
  
  private

  
    #############################################
    # 
    ##############################################
    def document_params
      params.require(:document).permit(:path, :category, :title, :path,
                                   :expiration, :user_id)
    end
end
