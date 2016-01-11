class BillsController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!

  def new
    @utilities = current_user.utilities.all
    @bill = Bill.new

    authorize @bill
  end

  def create
    @utilities = current_user.utilities.all
    @bill = Bill.new(bill_params)

    authorize @bill
    if @bill.save
    flash[:success] = 'Created Bill'
    end
    respond_with @bill
  end

  def index
    @bills = current_user.bills.all

    respond_with @bills
  end

  def show
    @bill = current_user.bills.find(params[:id])

    authorize @bill

    respond_with @bill
  end

  def edit
    @bill = current_user.bills.find(params[:id])
    @utilities = current_user.utilities.all

    authorize @bill
  end

  def update
    @utilities = current_user.utilities.all
    @bill = current_user.bills.find(params[:id])

    authorize @bill

    flash[:success] = 'Updated Bill' if @bill.save
    respond_with @bill
  end

  def destroy
    @bill = current_user.bills.find(params[:id])

    authorize @bill

    @bill.destroy

    flash[:success] = 'Deleted Bill' if @bill.destroyed?
    respond_with @bill
  end

  private

  def bill_params
    params.require(:bill).permit(:amount, :due_on, :utility_id)
  end
end
