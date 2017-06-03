class User::DepartmentsController < ApplicationController
    before_action :check
    before_action :find_department,:only=>[:show,:edit,:destroy,:update]
    def index
        @page_title = "Departments"
        @departments = Department.all
    end
    def new
        @page_title = "New a Department"
        @department = Department.new
    end
    def create
        @department = Department.new(department_params)
        if @department.save
            flash[:notice] = "A new department has been created successfully"
            redirect_to user_announcements_url
        else
            flash[:alert] = "Some field is not complete. Please retype again, thanks"
            render :action=>:new
        end
    end
    def show
        @page_title = @department.d_name
    end
    def edit
        @page_title = "Edit "+@department.d_name
    end
    def update
        if @department.update(department_params)
            flash[:notice] = "The department has been updated successfully"
            redirect_to user_departments_path,:method=>:get
        else
            flash[:alert] = "Some field is not complete. Please retype again, thanks"
            render :action=>:edit
        end
    end
    def destroy
        @department.destroy
        flash[:notice] = "The department has been removed successfully"
        redirect_to user_departments_path,:method=>:get
    end
private
    def find_department
        @department = Department.find(params[:id])
    end
    def department_params
        params.require(:department).permit(:d_name)
    end
    def check
        if !logged_in
            redirect_to announcements_url
        end
    end
end
