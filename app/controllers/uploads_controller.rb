class UploadsController < ApplicationController
	def new
		@upload = Upload.new
		@upload.sender = Sender.new
		@upload.recipients.new
		@upload.documents.new
	end

	def create
		@upload = Upload.new(upload_params)
		if @upload.save
			flash[:notice] = 'File uploaded successfully'
			redirect_to new_upload_path
		else
			render :new
		end
	end

private

	def upload_params
		params.require(:upload).permit(sender_attributes: [:name, :email],
																	 recipients_attributes: [:email],
																	 documents_attributes: [:file])
	end
end