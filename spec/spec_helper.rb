require 'rspec'
require 'rspec/autorun'
require 'shoulda/matchers/active_model'
require './app/repositories/user'
require './app/repositories/repository_support'

if User.get_model_class != User
  persistance = RepositorySupport.model_class_suffix == "Model" ? "ActiveRecord" : "Mongoid"
  puts "Testing with ActiveRepository and #{persistance}"

  if persistance == "Mongoid"
    Mongoid.load!("support/mongoid.yml", :development)
  else
    ActiveRecord::Base.establish_connection :adapter => "sqlite3", :database => ":memory:"
    
    ActiveRecord::Base.connection.create_table(:bet_models, :force => true) do |t|
      t.integer :user_id
      t.integer :match_id
      t.integer :home_team_score
      t.integer :away_team_score
      t.timestamps
    end
    
    ActiveRecord::Base.connection.create_table(:championship_models, :force => true) do |t|
      t.integer :owner_id
      t.string  :name
      t.timestamps
    end
    
    ActiveRecord::Base.connection.create_table(:group_models, :force => true) do |t|
      t.integer :championship_id
      t.string  :name
      t.timestamps
    end
    
    ActiveRecord::Base.connection.create_table(:match_models, :force => true) do |t|
      t.integer :group_id
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :home_team_score
      t.integer :away_team_score
      t.timestamps
    end
    
    ActiveRecord::Base.connection.create_table(:team_models, :force => true) do |t|
      t.integer :championship_id
      t.string  :name
      t.string  :flag_url
      t.timestamps
    end
    
    ActiveRecord::Base.connection.create_table(:user_models, :force => true) do |t|
      t.string  :name
      t.string  :email
      t.string  :external_id
      t.integer :score
      t.timestamps
    end
  end
else
  puts "Testing with ActiveRepository :inmemory"
end
