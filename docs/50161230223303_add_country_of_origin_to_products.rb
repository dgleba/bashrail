class AddCountryOfOriginToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :country_of_origin, index: true, foreign_key: true
  end
end
