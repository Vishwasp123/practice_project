class CompaniesController < ApplicationController

	before_action :set_company , only: %i[edit show  destroy update]

	def index
		@companies = Company.all
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(company_params)
		if @company.save
			redirect_to companies_path 
		else
			render :new
		end
	end

	def edit
	end

	def show
	end

	def update
		if @company.update
			redirect_to company_path
		else
			render :edit
		end
	end

	def destroy
		if @company.destroy
			redirect_to company_path
		end
	end

	private
	def set_company
		@company = Company.find(params[:id])
	end

	def company_params
		params.require(:company).permit(:name, :address , :contact_no , :email )
	end
end
