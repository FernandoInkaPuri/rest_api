class CreateCharges < ActiveRecord::Migration[7.1]
  def change
    create_table :charges do |t|
      t.string :payment_id
      t.string :payment_link

      t.timestamps
    end
  end
end
