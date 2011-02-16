class NotificationAddressesController < ApplicationController
  respond_to :html, :xml, :json
  load_and_authorize_resource

  def index
    @registration = Registration.find(params[:registration_id])
    @notification_addresses = @registration.notification_addresses
    respond_with @registration, @notification_addresses
  end

  def show
    @registration = Registration.find(params[:registration_id])
    respond_with @registration, @notification_address
  end

  def new
    @registration = Registration.find(params[:registration_id])
    @notification_address = NotificationAddress.new
    @notification_address.registration_id = @registration.id
    respond_with @registration, @notification_address
  end

  def edit
    @registration = Registration.find(params[:registration_id])
    respond_with @registration, @notification_address, :location => parent_path(@registration.student.parent)
  end

  def create
    @registration = Registration.find(params[:notification_address][:registration_id])
    @notification_address = NotificationAddress.new(params[:notification_address])
    if @notification_address.save
      flash[:success] = "New notification address saved successfully."
    else
      flash[:error] = "Could not save the new notification address."
    end
    respond_with @notification_address, :location => parent_path(@registration.student.parent)
  end

  def update
    @registration = Registration.find(params[:notification_address][:registration_id])
    if @notification_address.update_attributes(params[:notification_address])
      flash[:success] = "Updated the notification address successfully."
    else
      flash[:error] = "Could not update the notification address."
    end
    respond_with @notification_address, :location => parent_path(@registration.student.parent)
  end

  def destroy
    @notification_address.destroy
    @registration = Registration.find(params[:registration_id])
    flash[:notice] = "Deleted the notification address successfully."
    respond_with @notification_address, :location => parent_path(@registration.student.parent)
  end

end