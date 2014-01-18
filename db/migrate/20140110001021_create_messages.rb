class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.decimal :lat
      t.decimal :long
      t.string :msg, limit: 160

      t.timestamps
    end
  end
end
