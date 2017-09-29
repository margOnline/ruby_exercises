require 'sequel'

DB = Sequel.connetc('sqlite://dfs.db')

module Database
  def self.startup
    unless DB.table_exists?(:players)
      DB.create_table :players do
        primary_key :id
        String :name
        Integer :salary
        String :team
        String :matchup
        String :position
        Float :ppg
      end
    end
  end
end
