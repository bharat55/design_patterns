# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
  end

  def check
    Rails.logger.info "=================================================="
    Rails.logger.info "⚙️ EXECUTING PATTERNS VIA DASHBOARD CHECK ⚙️"
    Rails.logger.info "=================================================="

    # 1. Test Value Object
    @money = Money.new(500.0, "USD")
    Rails.logger.info "Value Object Tested: #{@money.format}"

    # 2. Test Query Object
    @unpaid_invoices = UnpaidInvoiceQuery.new.call
    Rails.logger.info "Query Object Tested (Unpaid Invoices Count): #{@unpaid_invoices.count}"

    # 3. Test Presenter
    client = Client.first_or_create!(name: "Test Client", email: "test@example.com")
    @presenter = InvoiceDashboardPresenter.new(client)
    Rails.logger.info "Presenter Tested: Billed Balance: #{@presenter.total_billed}"

    # 4. Test Builder
    invoice = Invoice.create!(client: client, amount: 150.0, currency: 'USD', status: 'pending')
    @built_doc = InvoicePdfBuilder.new(invoice).add_header.add_body.build
    Rails.logger.info "Builder Tested: Generated Payload: #{@built_doc.inspect}"

    # 5. Test Form Object
    @form = ClientOnboardingForm.new(
      name: "Dynamic User", 
      email: "dynamic@example.com", 
      company_name: "Tech Corp", 
      hourly_rate: 85
    )
    @form.save
    Rails.logger.info "Form Object Tested & Saved to Database."
    Rails.logger.info "=================================================="

    # Redirect or respond
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Server log generated successfully! Check your console." }
      format.json { render json: { status: 'success', data: @built_doc } }
    end
  end
end