class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @subscriptions = current_user.subscriptions
  end

  def show
    @subscription = current_user.subscriptions.find(params[:id])
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = current_user.subscriptions.build(subscription_params)
    if @subscription.save
      redirect_to @subscription, notice: 'Abonelik başarıyla oluşturuldu.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @subscription = current_user.subscriptions.find(params[:id])
  end

  def update
    @subscription = current_user.subscriptions.find(params[:id])
    if @subscription.update(subscription_params)
      redirect_to @subscription, notice: 'Abonelik başarıyla güncellendi.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subscription = current_user.subscriptions.find(params[:id])
    @subscription.destroy
    redirect_to subscriptions_path, notice: 'Abonelik silindi.'
  end

  private
  def subscription_params
    params.require(:subscription).permit(:name, :status, :start_date, :end_date)
  end
end
