#require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  num_points = 0
  game_hash.each do |home_or_away, team_info|
    team_info.each do |specific_info, values|
      if specific_info.to_s == "players"
        values.each do |players, stats|
          if player_name == players
            stats.each do |stat, value|
              if stat.to_s == "points"
                num_points = value
              end
            end
          end
        end
      end
    end
  end
  num_points
end

def shoe_size(player_name)
  shoe_size = 0
  game_hash.each do |home_or_away, team_info|
    team_info.each do |specific_info, values|
      if specific_info.to_s == "players"
        values.each do |players, stats|
          if player_name == players
            stats.each do |stat, value|
              if stat.to_s == "shoe"
                shoe_size = value
              end
            end
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(team_name)
  team_colors = []
  team_place = ''

  game_hash.each do |home_or_away, team_info|
    team_info.each do |specific_info, values|
      if values == team_name
        team_place = home_or_away
        team_colors = game_hash[team_place][:colors]
      end
    end
  end
  team_colors
end


def team_names
  team_names = []
  game_hash.each do |home_or_away, big_inner_hash|
    big_inner_hash.each do |team_info, specific_info|
      if team_info.to_s == "team_name"
        team_names << specific_info
      end
    end
  end
  team_names
end

def player_numbers(team_name)
  jersey_numbers = []
  team_place = ''

  game_hash.each do |home_or_away, team_info|
    team_info.each do |specific_info, values|
      if values == team_name
        team_place = home_or_away
        game_hash[team_place][:players].each do |player, stats|
          stats.each do |specific_stat, value|
            if specific_stat.to_s == "number"
              jersey_numbers << value
            end
          end
        end
      end
    end
  end
  jersey_numbers
end


def player_stats(player_name)
  player_stats = {}
  game_hash.each do |home_or_away, team_info|
    team_info.each do |specific_info, values|
      if specific_info.to_s == "players"
        values.each do |players, stats|
          if player_name == players
            player_stats = stats
          end
        end
      end
    end
  end
  player_stats
end

def big_shoe_rebounds
  array_of_players = []
  array_of_shoe_sizes = []
  name_player_w_largest_size = ''
  num_rebounds = 0

  game_hash.each do |home_or_away, team_info|
    team_info.each do |specific_info, values|
      if specific_info.to_s == "players"
        values.each do |players, stats|
          array_of_players << players
        end
      end
    end
  end
  array_of_players.each_with_index do |name, index|
    array_of_shoe_sizes << shoe_size(name)
    sorted_array = array_of_shoe_sizes.sort
    largest_size = sorted_array[-1]
    index_name_largest_shoe = array_of_shoe_sizes.index(largest_size)
    name_player_w_largest_size = array_of_players[index_name_largest_shoe]
  end
  game_hash.each do |home_or_away, team_info|
    team_info.each do |specific_info, values|
      if specific_info.to_s == "players"
        values.each do |players, stats|
          if name_player_w_largest_size == players
            stats.each do |stat, value|
              if stat.to_s == "rebounds"
                num_rebounds = value
              end
            end
          end
        end
      end
    end
  end
  num_rebounds

end
