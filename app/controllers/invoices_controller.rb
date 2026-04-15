
class InvoicesController < ApplicationController
  before_action :authenticate_user!

  def upcoming
    @upcoming_invoices = current_user.invoices.where(status: 'unpaid').where('due_at >= ? AND due_at <= ?', Date.today, Date.today + 7.days).order(:due_at)
  end

  def destroy
    @invoice = current_user.invoices.find(params[:id])
    @invoice.destroy
    redirect_to invoices_path, notice: 'Fatura silindi.'
  end

  def index
    @invoices = Invoice.where(user: current_user)
  end

  def show
    @invoice = current_user.invoices.find(params[:id])
  end

  def new
    @invoice = Invoice.new
    if params[:subscription_id].present?
      @selected_subscription = current_user.subscriptions.find_by(id: params[:subscription_id])
    end
  end

  def create
    @invoice = current_user.invoices.build(invoice_params)
    if @invoice.save
      redirect_to @invoice, notice: 'Fatura başarıyla oluşturuldu.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @invoice = current_user.invoices.find(params[:id])
  end

  def update
    @invoice = current_user.invoices.find(params[:id])
    if @invoice.update(invoice_params)
      redirect_to @invoice, notice: 'Fatura başarıyla güncellendi.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def invoice_params
    params.require(:invoice).permit(:subscription_id, :amount, :status, :issued_at, :due_at)
  end
end
