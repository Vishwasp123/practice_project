class EmployeesController < ApplicationController

	before_action :set_employee, only: %i[ show edit update destroy ]
	skip_before_action :verify_authenticity_token
	

	def index
		@q = Employee.ransack(params[:q])
		@employees = @q.result(distinct: true)
		@countries = Employee.pluck(:country).uniq.compact
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(employee_params)
		respond_to do |format|
			if @employee.save 
				format.html {redirect_to employees_path, alert: 'Employee created successfully'}
				format.json { @employee }
			else
				render :new
			end
		end
	end

	def update
		if @employee.update(employee_params)
			redirect_to employees_path
		else
			render :edit
		end

	end 

	def destroy
		if @employee.destroy
			redirect_to employees_path	
		end
	end

	def edit
	end

	def show
	end

	# def get_employees
	# 	if params[:all].present? && params[:all]
	# 		render json: { employees: Employee.all, status: 200}
	# 	end
	# end

	private
	def employee_params
		params.require(:employee).permit(:first_name , :last_name , :email , :phone_number , :employee_id, :address ,:country )
	end

	def set_employee
		@employee = Employee.find(params[:id])
	end

end
