class Api::V1::NotesController < Api::V1::BaseController

	def index
		respond_with Note.all
	end

	def create
		respond_with :api, :v1, Note.create(note_params)
	end

	def destroy
		respond_with Note.destroy(params[:id])
	end

	def update
		note = Note.find(params[:id])	
		note.update_attributes(note_params)
		respond_with item, json: item
	end

	private

		def note_params
			params.require(:note).permit(:id, :name, :description)			
		end

end