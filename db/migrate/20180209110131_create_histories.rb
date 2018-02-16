class CreateHistories < ActiveRecord::Migration[5.1]
  def change
      create_table :histories do |t|
          t.string :name
          t.string :email
          t.string :inside
      end
  end
end

   