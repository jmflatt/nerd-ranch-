class UtilitiesController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!

  def index
    @utilities = current_user.utilities.all

    respond_with @utilities
  end

  def create
    @utility = Utility.new(utility_params)

    authorize @utility

    privilege = Privilege.new(
      user: current_user,
      utility: @utility,
      permission: 'owner'
    )

    flash[:success] = 'Successfully added new Utility' if @utility.save && privilege.save
    respond_with @utility
  end

  def show
    @utility = current_user.utilities.find(params[:id])

    authorize @utility
  end

  def new
    @utility = current_user.utilities.new

    authorize @utility
  end

  def update
    @utility = current_user.utilities.find(params[:id])

    authorize @utility

    flash[:success] = 'Successfully updated Utility' if @utility.update(utility_params)
    respond_with @utility
  end

  def edit
    @utility = current_user.utilities.find(params[:id])

    authorize @utility
  end

  def destroy
    @utility = current_user.utilities.find(params[:id])

    authorize @utility

    @utility.destroy

    redirect_to utilities_path
  end

  private

  def utility_params
    params.require(:utility).permit(:name)
  end

end
