class AddCityToHotels < ActiveRecord::Migration[7.1]
  def change
    add_column :hotels, :city, :string
  end
end
