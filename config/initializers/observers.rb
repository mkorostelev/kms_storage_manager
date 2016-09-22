ActiveRecord::Base.add_observer OrderObserver.instance
ActiveRecord::Base.add_observer ItemObserver.instance
