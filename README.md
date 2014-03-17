# Sports Betting Engine

This project is an example on using ActiveRepository (https://github.com/efreesen/active_repository)

In order to make testing with the diferent persistence methods easier. I made a support class, so you have only to change things inside this class and it will propagate to all repository classes in the project:

In Memory Persistence
---------------------

To test the project using in memory persistence change app/repositories/base_repository.rb to look like this:

    class BaseRepository < ActiveRepository::Base
      self.save_in_memory = true
      # self.postfix = "Model"
    end

Using this approach my tests took:

Finished in 0.85932 seconds
25 examples, 0 failures

ActiveRecord Persistence
------------------------

If you want to test it with ActiveRecord (using SQLite3 :inmemory:), it should look like this

    class BaseRepository < ActiveRepository::Base
      self.save_in_memory = false
      self.postfix = "Model"
    end

Using this approach my tests took:

Finished in 1.75 seconds
25 examples, 0 failures

Mongoid Persistence
-------------------

And finally if you want to test it using Mongo (you must have a server running on localhost), it should look like this:

    class BaseRepository < ActiveRepository::Base
      self.save_in_memory = false
      self.postfix = "Document"
    end

Using this approach my tests took:

Finished in 1.77 seconds
25 examples, 0 failures

Thank You
---------

Thank you for trying out ActiveRepository and Happy Coding!!!