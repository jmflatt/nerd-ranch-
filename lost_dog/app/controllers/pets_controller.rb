class PetsController < ApplicationController

 skip_before_action :ensure_user_not_mobile, only: :index

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id]).decorate
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      flash[:notice] = "Pet Created Successfully"
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    pet = Pet.find(params[:id])
    if request.remote_ip == "127.0.0.1"
      pet.destroy
      redirect_to pets_path
    else
      render text: 'Cannot Delete Unless You are Host'
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :color, :last_seen_at)
  end
end
