class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.jsonb :data, null: false, default: {}

      t.timestamps
    end
  end
end
