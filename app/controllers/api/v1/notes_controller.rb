class Api::V1::NotesController < Api::V1::BaseController

	def index
		render json: Note.all
	end

	def create
		note = Note.new(note_params)
		if note.save
			render json: note
		else
			render json: {errors: note.errors.messages}
		end
	end

	def update
		note = Note.find(params[:id])
		if note.update(note_params)
			render json: {status: 200}
		else
			render json: {errors: note.errors.messages}
		end
	end

	def destroy
		Note.destroy(params[:id])
		render json: {status: 200}
	end

	private

		def note_params
			params.require(:note).permit(:name, :description)			
		end

end