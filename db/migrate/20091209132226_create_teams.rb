class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name

      t.timestamps
    end
    add_column :users, :team_id, :integer
  end

  def self.down
    remove_column :users, :team_id
    drop_table :teams
  end
end
