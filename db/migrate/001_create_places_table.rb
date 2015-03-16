class CreatePlacesTable < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.boolean :ready, default: false
      t.string :title
      t.string :property_type
      t.string :address
      t.float :nightly_rate
      t.integer :max_guests
      t.string :email
      t.string :phone_number
    end
  end
end
