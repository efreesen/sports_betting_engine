require "./app/repositories/user"
require "./app/repositories/match"

class Registration
  def self.register(attributes)
    external_id = attributes[:external_id]
    
    user = User.find_by_external_id external_id

    if user.nil?
      user = User.create(attributes.merge(:score => 0))
    else
      user.update_attributes(attributes)
    end

    user.reload
  end

  def self.update(external_id, key, value)
    user = User.find_by_external_id external_id

    user.update_attribute key.to_sym, value unless key == :external_id

    user.reload

    user
  end

  def self.bet!(user, match_id, home_team_score, away_team_score)
    match = Match.find_by_id(match_id)

    unless match.nil? || user.nil?
      bet = Bet.find_or_create(
        :user_id         => user.id,
        :match_id        => match_id
      )

      bet.update_attributes(
        :home_team_score => home_team_score,
        :away_team_score => away_team_score
      )

      bet.reload
    else
      match
    end
  end

  def self.update_scores(championship)
    championship.betters.each do |user|
      user.score = 0

      user.bets.each do |bet|
        match = bet.match

        home_score = bet.home_team_score == match.home_team_score ? 1 : 0
        away_score = bet.away_team_score == match.away_team_score ? 1 : 0

        score = (home_score + away_score)
        score = (score == 2 ? 3 : score)

        user.score += score
      end

      user.persist
    end
  end
end