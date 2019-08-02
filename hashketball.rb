# Write your code here!

require "pry"

def game_hash
   {
     :away => { :team_name => "Charlotte Hornets",
                :colors => ["Turquoise", "Purple"],
                :players => [
                  {:player_name => "Jeff Adrien",
                   :number => 4,
                   :shoe => 18,
                   :points => 10,
                   :rebounds => 1,
                   :assists => 1,
                   :steals => 2,
                   :blocks => 7,
                   :slam_dunks => 2
                  },
                  {:player_name => "Bismack Biyombo",
                   :number => 0,
                   :shoe => 16,
                   :points => 12,
                   :rebounds => 4,
                   :assists => 7,
                   :steals => 22,
                   :blocks => 15,
                   :slam_dunks => 10
                  },
                  {:player_name => "DeSagna Diop",
                   :number => 2,
                   :shoe => 14,
                   :points => 24,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 4,
                   :blocks => 5,
                   :slam_dunks => 5
                  },
                  {:player_name => "Ben Gordon",
                   :number => 8,
                   :shoe => 15,
                   :points => 33,
                   :rebounds => 3,
                   :assists => 2,
                   :steals => 1,
                   :blocks => 1,
                   :slam_dunks => 0
                  },
                  {:player_name => "Kemba Walker",
                   :number => 33,
                   :shoe => 15,
                   :points => 6,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 7,
                   :blocks => 5,
                   :slam_dunks => 12
                  }
                ]
             },
     :home => { :team_name => "Brooklyn Nets",
                :colors => ["Black", "White"],
                :players => [
                  {:player_name => "Alan Anderson",
                   :number => 0,
                   :shoe => 16,
                   :points => 22,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 3,
                   :blocks => 1,
                   :slam_dunks => 1
                  },
                  {:player_name => "Reggie Evans",
                   :number => 30,
                   :shoe => 14,
                   :points => 12,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 12,
                   :blocks => 12,
                   :slam_dunks => 7
                  },
                  {:player_name => "Brook Lopez",
                   :number => 11,
                   :shoe => 17,
                   :points => 17,
                   :rebounds => 19,
                   :assists => 10,
                   :steals => 3,
                   :blocks => 1,
                   :slam_dunks => 15
                  },
                  {:player_name => "Mason Plumlee",
                   :number => 1,
                   :shoe => 19,
                   :points => 26,
                   :rebounds => 11,
                   :assists => 6,
                   :steals => 3,
                   :blocks => 8,
                   :slam_dunks => 5
                  },
                  {:player_name => "Jason Terry",
                   :number => 31,
                   :shoe => 15,
                   :points => 19,
                   :rebounds => 2,
                   :assists => 2,
                   :steals => 4,
                   :blocks => 11,
                   :slam_dunks => 1
                  }
                ]
     }
   }
 end



###########

def big_shoe_rebounds
clown_feet = 0
clown_hoops = 0
  game_hash.each do |loc, team|
    team.each do |category, stat|
      if category == :players
        stat.each do |player_stat|
          if player_stat[:shoe] > clown_feet
            clown_feet = player_stat[:shoe]
            clown_hoops = player_stat[:rebounds]
          end
        end
      end
    end
  end
clown_hoops
end
#######

def player_stats(player)
no_name = {} 
  game_hash.each do |loc, team|
    team.each do |category, stat|
      if category == :players
        stat.each do |player_stat|
          if player_stat[:player_name] == player
#            player_stat.reject {|key, value| key == :player_name}
              no_name = player_stat.select {|k,v| k != :player_name}
          end
        end
      end
    end
  end
no_name
end
#######

def player_numbers(teamname)
jerseys = []
game_hash.each do |loc, team|
    if team[:team_name] == teamname
    team.each do |category, stat|
      if category == :players
        stat.each do |player_stat|
            jerseys << player_stat[:number]
          end
        end
      end
    end
  end
jerseys
end
#######

def team_names
  game_hash.map do |loc, team|
    team[:team_name]
  end
end
#######

def team_colors(teamname)
  game_hash.each do |loc, team|
      if team[:team_name] == teamname
        return team[:colors]
      end
  end
end
#######

def shoe_size(player)
  game_hash.each do |loc, team|
    team.each do |category, stat|
      if category == :players
        stat.each do |player_stat|
          if player_stat[:player_name] == player
            return player_stat[:shoe]
          end
        end
      end
    end
  end
end
#######

def num_points_scored(player)
  game_hash.each do |loc, team|
    team.each do |category, stat|
      if category == :players
        stat.each do |player_stat|
          if player_stat[:player_name] == player
            return player_stat[:points]
          end
        end
      end
    end
  end
end

##########BONUS##########

def most_points_scored
swish = 0
baller = "mvp"
  game_hash.each do |loc, team|
    team.each do |category, stat|
      if category == :players
        stat.each do |player_stat|
          if player_stat[:points] > swish
            swish = player_stat[:points]
            baller = player_stat[:player_name]
          end
        end
      end
    end
  end
baller
end

#######

def winning_team
  home_skills = 0
  away_skills = 0
    game_hash.each do |loc, team|
      if loc == :home
        team.each do |category, stat|
          if category == :players
            stat.each do |player_stat|
            home_skills = home_skills + player_stat[:points]
            end
          end
        end
      end
      if loc == :away
        team.each do |category, stat|
          if category == :players
            stat.each do |player_stat|
            away_skills = away_skills + player_stat[:points]
            end
          end
        end
      end
    end
  if home_skills <= away_skills
  game_hash[:away][:team_name]
  end
  if away_skills <= home_skills
  game_hash[:home][:team_name]
  end
end



#######

def player_with_longest_name
name_length = 0
nickname_needed = "qwerty"
  game_hash.each do |loc, team|
    team.each do |category, stat|
      if category == :players
        stat.each do |player_stat|
          if player_stat[:player_name].length > name_length
            name_length = player_stat[:player_name].length
            nickname_needed = player_stat[:player_name]
          end
        end
      end
    end
  end
nickname_needed
end

########## SUPER BONUS ##########

def long_name_steals_a_ton?
swipes = 0
swiper = "burglar"
  game_hash.each do |loc, team|
    team.each do |category, stat|
      if category == :players
        stat.each do |player_stat|
          if player_stat[:steals] > swipes
            swipes = player_stat[:steals]
            swiper = player_stat[:player_name]
          end
        end
      end
    end
  end
swiper == player_with_longest_name
end
