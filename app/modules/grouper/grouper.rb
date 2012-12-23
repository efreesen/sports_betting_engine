require "./app/repositories/group.rb"

class Grouper
  def self.get_group(user, name="Grupo")
    group = Group.find_by_owner_id(user.id)

    group = Group.add(user.id, name) if group.nil?

    group
  end

  def self.change_name(user_id, name)
    group = Group.find_by_owner_id(user_id)

    if group.present?
      group.update_attribute :name, name
    else
      raise "Group does not exist"
    end
  end
end