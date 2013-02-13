require "./app/repositories/match"

class MatchMaker
  def self.add!(group, home_team, away_team)
    Match.create(:group => group, :home_team => home_team, :away_team => away_team)
  end

  def self.change_match(id, new_home_team, new_away_team)
    match = Match.find_by_id(id)

    if match.present?
      match.update_attributes :home_team => new_home_team, :away_team => new_away_team
      match.reload
    end

    match
  end

  def self.add_or_update_official_score(id, home_team_score, away_team_score)
    match = Match.find_by_id(id)

    if match.present?
      match.update_attributes :home_team_score => home_team_score, :away_team_score => away_team_score
    end

    match
  end
end