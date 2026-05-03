class CreateInvoices < ActiveRecord::Migration[8.1]
  def change
    create_table :invoices do |t|
      t.references :client, null: false, foreign_key: true
      t.float :amount
      t.string :currency
      t.string :status

      t.timestamps
    end
  end
end
