require "pry"

def game_hash
  return {home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {player_name: "Alan Anderson",
          stats: {
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
            assists: 12,
            steals: 3,
            blocks: 1,
            slam_dunks: 1
          }
        },
        {player_name: "Reggie Evans",
          stats: {
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7
          }
        },
        {player_name: "Brook Lopez",
          stats: {
            number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15
          }
        },
        {player_name: "Mason Plumlee",
          stats: {
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 11,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5
          }
        },
        {player_name: "Jason Terry",
          stats: {
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
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {player_name: "Jeff Adrien",
          stats: {
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2
          }
        },
        {player_name: "Bismack Biyombo",
          stats: {
            number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4,
            assists: 7,
            steals: 22,
            blocks: 15,
            slam_dunks: 10
          }
        },
        {player_name: "DeSagna Diop",
          stats: {
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5
          }
        },
        {player_name: "Ben Gordon",
          stats: {
            number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals: 1,
            blocks: 1,
            slam_dunks: 0
          }
        },
        {player_name: "Kemba Walker",
          stats: {
            number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 7,
            blocks: 5,
            slam_dunks: 12
          }
        }
      ]
    }
  }
end

def num_points_scored(name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      if player[:player_name] == name
        return player[:stats][:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      if player[:player_name] == name
        return player[:stats][:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |team, team_data|
    teams << team_data[:team_name]
  end
  teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |player|
        numbers << player[:stats][:number]
      end
    end
  end
  numbers
end

def player_stats(name)
  player_hash = {}
  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      if player[:player_name] == name
        return player[:stats]
      end
    end
  end
end

def big_shoe_rebounds
  sizes = []
  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      sizes << player[:stats][:shoe]
    end
    team_data[:players].each do |player|
      if player[:stats][:shoe] == sizes.sort.last
        return player[:stats][:rebounds]
      end
    end
  end
end

def most_points_scored
  scores = []
  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      scores << player[:stats][:points]
    end
  end
  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      if player[:stats][:points] == scores.sort.last
        return player[:player_name]
      end
    end
  end
end

def winning_team
  points = []
  totals = []

  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      points << player[:stats][:points]
    end
    totals << points.inject(0){|sum,x| sum + x } # resource for students: https://stackoverflow.com/questions/1538789/how-to-sum-array-of-numbers-in-ruby
    points.clear
  end

  if totals[0] > totals[1]
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  names = []
  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      names << player[:player_name]
    end
  end
  names.max_by { |name| name.length } # http://ruby-doc.org/core-2.1.0/Enumerable.html#method-i-max_by
end

def long_name_steals_a_ton?
  steals = []
  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      steals << player[:stats][:steals]
    end
    team_data[:players].each do |player|
      if player[:player_name] == player_with_longest_name && player[:stats][:steals] == steals.sort.last
        return true
      end
    end
  end
end
