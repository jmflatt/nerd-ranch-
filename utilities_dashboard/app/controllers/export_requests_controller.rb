class ExportRequestsController < ApplicationController
  def create
    BillsExportJob.perform_async(current_user.id)
    flash[:success] = 'Your Export will be Delivered via Email'
    redirect_to bills_path
  end
end
