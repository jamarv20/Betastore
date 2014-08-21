class CreateMynewmodels < ActiveRecord::Migration
  def change
    create_table :mynewmodels do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
