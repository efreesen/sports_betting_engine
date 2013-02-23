# Sports Betting Engine

This project is an example on using ActiveRepository (https://github.com/efreesen/active_repository)

In order to make testing with the diferent persistance methods easier. I made a support class, so you have only to change things inside this class and it will propagate to all repository classes in the project:

To test the project using in memory persistance change app/repositories/repository_support.rb to look like this:

  class RepositorySupport
    def self.save_in_memory?
      true
      # false
    end

    def self.model_class_suffix
      "Model"
      # "Document"
    end
  end

Using this approach my tests took:

Finished in 0.12586 seconds
25 examples, 0 failures

==========

If you want to test it with ActiveRecord (using SQLite3 :inmemory:), it should look like this

  class RepositorySupport
    def self.save_in_memory?
      true
      false
    end

    def self.model_class_suffix
      "Model"
      # "Document"
    end
  end

Using this approach my tests took:

Finished in 0.68653 seconds
25 examples, 0 failures

==========

And finally if you want to test it using Mongo (you must have a server running on localhost), it should look like this:

  class RepositorySupport
    def self.save_in_memory?
      true
      false
    end

    def self.model_class_suffix
      "Model"
      "Document"
    end
  end

Using this approach my tests took:

Finished in 0.95125 seconds
25 examples, 0 failures

==========

Thank you for trying out ActiveRepository and Happy Coding!!!