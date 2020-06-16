class CreateAdiministrators < ActiveRecord::Migration[5.2]
  def change
    create_table :adiministrators do |t|

      t.timestamps
    end
  end
end
