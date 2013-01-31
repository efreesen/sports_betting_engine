require "./app/repositories/match"

class MatchMaker
  def self.add!(group, home_team, away_team)
    Match.create(:group => group, :home_team => home_team, :away_team => away_team)
  end

  def self.change_match(id, new_home_team, new_away_team)
    match = Match.find_by_id(id)

    if match.present?
      match.home_team_id = new_home_team.id
      match.away_team_id = new_away_team.id
      match.save
    end

    match
  end

  def self.add_or_update_official_score(id, home_team_score, away_team_score)
    match = Match.find_by_id(id)

    if match.present?
      match.home_team_score = home_team_score
      match.away_team_score = away_team_score
      match.save
    end

    match
  end
end