class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_number,     null: false
      t.integer    :prefecture_id,   null: false
      t.string     :area,            null: false
      t.string     :area_number,     null: false
      t.string     :building
      t.string     :number,          null: false
      t.references :purchase_record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
