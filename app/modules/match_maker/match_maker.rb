require "./app/repositories/match"

class MatchMaker
  def self.add!(group, home_team, away_team)
    Match.create(:group_id => group.id, :home_team_id => home_team.id, :away_team_id => away_team.id)
  end

  def self.change_match(id, new_home_team, new_away_team)
    match = Match.find_by(id: id)

    if match.present?
      match.update_attributes :home_team_id => new_home_team.id, :away_team_id => new_away_team.id
      match.reload
    end

    match
  end

  def self.add_or_update_official_score(id, home_team_score, away_team_score)
    match = Match.find_by(id: id)

    if match.present?
      match.update_attributes :home_team_score => home_team_score, :away_team_score => away_team_score
      Registration.update_scores(match.group.championship)
    end

    match
  end
end