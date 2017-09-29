URL = 'https://ww.draftkings.com/lineup/getavailableplayerscsv?contestTypeId=28&draftGroupId=14039'
require './csv_analysis'
require './database'

module Tracker
  def self.run
    Database.setup
    CsvAnalysis.scrape(url)
    players_table = DB[:players]
    price_changes = []

    CsvAnalysis.format_for_database.each do |player|
      existing_player = DB[:players].where(name: player[:name], team: player[:team]).first
      if existing_player
        next unless existing_player[:salary] != player[:salary].to_i
        price_changes << existing_player
        DB[:players].where(id: existing_player[:id]).update(salary: player[:salary])
      else
        players_table.insert(player)
      end
    end
  end

end

Tracker.run