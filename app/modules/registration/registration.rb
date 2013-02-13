require "./app/repositories/user"

class Registration
  def self.register(attributes)
    external_id = attributes[:external_id]
    
    user = User.find_by_external_id external_id

    if user.nil?
      user = User.create(attributes)
    else
      user = user.update_attributes(attributes)
    end

    user.reload
  end

  def self.update(external_id, key, value)
    user = User.find_by_external_id external_id

    user.update_attribute key.to_sym, value unless key == :external_id

    user.reload
  end

  def self.bet!(user, match_id, home_team_score, away_team_score)
    match = Match.find_by_id(match_id)

    match.nil? ? nil : Bet.create(
      :user_id         => user.id,
      :match_id        => match_id,
      :home_team_score => home_team_score,
      :away_team_score => away_team_score
    )
  end
end