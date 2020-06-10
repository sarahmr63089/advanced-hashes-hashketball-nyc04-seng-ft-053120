# Write your code below game_hash
require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# helper method to return arrays of player hashes: home, away, all
def get_home_players_hash
  game_hash[:home][:players]
end

def get_away_players_hash
  game_hash[:away][:players]

end

def all_players
  game_hash[:home][:players].concat(game_hash[:away][:players])
end

# gets points scored by a player
def num_points_scored(player_name) # re-write to use all_players
  game_hash
  home_players = get_home_players_hash
  away_players = get_away_players_hash

  points = 0
  
  home_players.each { |hash_for_player|
    if hash_for_player.has_value?(player_name)
      points = hash_for_player[:points]
    else
      away_players.each { |hash_for_player|
      if hash_for_player.has_value?(player_name)
        points = hash_for_player[:points]
      end
      }
    end
  } 

  points
end

# gets shoe size for a player
def shoe_size(player_name) # re-write to use all_players
  game_hash
  home_players = get_home_players_hash
  away_players = get_away_players_hash

  shoe_size = 0
  
  home_players.each { |hash_for_player|
    if hash_for_player.has_value?(player_name)
      shoe_size = hash_for_player[:shoe]
    else
      away_players.each { |hash_for_player|
      if hash_for_player.has_value?(player_name)
        shoe_size = hash_for_player[:shoe]
      end
      }
    end
  } 

  shoe_size
end

# get array of a team's colors
def team_colors(team_name) 
  if game_hash[:home].has_value?(team_name)
    game_hash[:home][:colors]
  else
    game_hash[:away][:colors]
  end
end

# get array of team names
def team_names 
  team_names = []

  game_hash.each { |home_or_away, attributes|
    if attributes.has_key?(:team_name)
      team_names << attributes[:team_name]
    end
  }

  team_names
end

# get array of a team's player numbers
def player_numbers(team_name)
  player_numbers = []

  if game_hash[:home].has_value?(team_name)
    get_home_players_hash.each { |player_hash|
      player_numbers << player_hash[:number]
    }
  else
    get_away_players_hash.each { |player_hash|
      player_numbers << player_hash[:number]
    }
  end

  player_numbers
end

# gets stats for a player
def player_stats(player_name)
   all_players.find { |player_hash|
    if player_hash.has_value?(player_name)
      player_hash
    end
  }
end

#that will return the number of rebounds associated with the player that has the largest shoe size
def big_shoe_rebounds
  big_shoe = nil
  rebounds = nil
  all_players.each { |player_hash|
    player_hash.each { |field, data|
      if field == :shoe
        if big_shoe.nil?
          big_shoe = data
        elsif data > big_shoe
          big_shoe = data
        end
      end
    }
  }

  all_players.each { |player_hash|
    if player_hash[:shoe] == big_shoe
      rebounds = player_hash[:rebounds]
    end
  }

  rebounds
end
