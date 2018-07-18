class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :ldap
      t.string :instruction
      t.boolean :status
      t.boolean :done

      t.timestamps null: false
    end
  end
end
