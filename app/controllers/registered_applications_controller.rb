class RegisteredApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def create
    @registered_application = RegisteredApplication.new
    @registered_application.assign_attributes(registered_application_params)

    if @registered_application.save
      flash[:notice] = "The #{@registered_application.name} was saved successfully."
      redirect_to @registered_application
    else
      flash[:error] = "There was an error saving the Registered Application."
      render :new
    end
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.assign_attributes(registered_application_params)

    if @registered_application.save
      flash[:notice] = "#{@registered_application.name} was successfully updated."
      redirect_to @registered_application
    else
      flash[:alert] = "There was an error saving the Registered Application. Please try again."
      render :edit
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
      redirect_to registered_applications_path
    else
      flash[:alert] = "There was an error deleting the Registered Application."
      render :show
    end
  end

  private
  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end

end
