class CreateLocalizations < ActiveRecord::Migration[5.1]
  def change
    create_table :localizations do |t|
      t.references :page, foreign_key: true
      t.jsonb :data, null: false, default: {}

      t.timestamps
    end
  end
end
