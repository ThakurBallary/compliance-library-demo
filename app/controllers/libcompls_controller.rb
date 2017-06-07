class LibcomplsController < ApplicationController

	def index
		@libcompls = Libcompl.all
	end

	def create
		@libcompl = Libcompl.new(libcompl_params)
		if @libcompl.save
			render json: @libcompl
		else
			render json: @libcompl.errors, status: :unprocessable_entity			
		end
	end

	def update
		@libcompl = Libcompl.find(params[:id])
		if @libcompl.update(libcompl_params)
			render json: @libcompl
		else
			render json: @libcompl.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@libcompl = Libcompl.find(params[:id]).destroy
	end

	private

	def libcompl_params
		params.require(:libcompl).permit(:libindex, :question_index, :compliance_task, :compliance_details, :frequency, :website_link, :form_link, :task_details, :date, :demo)
	end

end
