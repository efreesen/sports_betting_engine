require "./app/repositories/championship"
require "./app/repositories/group"
require "./app/repositories/team"

class Grouper
  def self.find_or_create_championship(user_id, name="Championship")
    get_championship(user_id)

    @championship = Championship.add(user_id, name) if @championship.nil?

    @championship
  end

  def self.change_name(user_id, name)
    get_championship(user_id)

    if @championship.present?
      @championship.update_attribute :name, name
    else
      raise "Championship does not exist"
    end
  end

  def self.add_team(user_id, name, flag_url)
    get_championship(user_id)

    if @championship.present?
      Team.add(@championship.id, name, flag_url)
    else
      raise "Championship does not exist"
    end
  end

  def self.update_team(team_id, attributes)
    team = Team.find_by_id(team_id)

    if team.present?
      team.update_attributes(attributes)
      team.reload
    else
      raise "Championship does not exist"
    end
  end

  def self.add_group(user_id, championship_name, name)
    get_championship(user_id, championship_name)

    if @championship.present?
      Group.add(@championship.id, name)
    else
      raise "Championship does not exist"
    end
  end

  private
    def self.get_championship(user_id, name = nil)
      @championship = (name.nil? ? 
                       Championship.where(:owner_id => user_id) :
                       Championship.where(:owner_id => user_id, :name => name)).first
    end
end