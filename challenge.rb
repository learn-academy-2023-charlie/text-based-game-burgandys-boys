def explore_island #Define the method for the game
    #Make some generic scenario to kind of give the player an idea of whats going on here 
    puts "You find yourself stranded on a mysterious island after a shipwreck."
    puts "You must find a way to signal for rescue."
  
    choices = [#Create a array of choices.  The user can go east, west, or up the middle, ultimatley I want the user to go middle. Eastward is a bad route, losing condition.  In the middle is a waterfall...user can get fresh water to drink.  A stretch would be to give different options for each direction by using key value pairs, since everything in ruby is an object (OOP BABY!) The Key will be the verb, the Value will be the response
      { verb: "go east", response: "As you walk towards the east, you encounter an inhospitable-looking passage.\nIt appears treacherous and impassable. You decide it's best not to proceed further in that direction." },
      { verb: "go west", response: "Heading west, you stumble upon an area with light foliage and tall, ample canopies.\nIt seems like a suitable place to seek shelter from the elements. However, Tom Hanks and Wilson are already occupying the shelter. You must defeat them to claim it." },
      { verb: "go middle", response: "You arrive at a majestic waterfall cascading down into a serene pool. It looks like a perfect place to find shelter and rest." }
    ]
  #Create a infinite loop that prompts the player to do something, make a choice based on a verb.  The condition will run for forever util it has reached true, when the user enters a verb. the \ is a special charecter that allows you to do special things, like enter a verb. We want to get the user input by setting user_input to gets.chomp Account for casing using downcase
    while true
      puts "\nEnter a verb to explore the island: "
      user_input = gets.chomp.downcase
  
      #call on the choices array, the .find will look for go east, go middle, or go west. the .find will execute and when the correct phrase is entered it will return the appropriate messege for that phrase Had to research how to do this, the |c| and c[verb], the first is a temp variable representing each element in the array, c[:verb] accesses the key in the array, or the verb,
      choice = choices.find { |c| c[:verb] == user_input }
  
      #Create a few conditional statements.

      if choice
        puts choice[:response]
        case choice[:verb]
        when "go east"
          puts "What would you like to do next?"
          puts "1. Continue eastward, your mama didn't raise no chump"
          puts "2. Turn around"
          print "Enter your choice (1 or 2): "
          user_choice = gets.chomp.to_i
  
          if user_choice == 1
            puts "You fall off a cliff and explode into a bloody mess when you hit the ground. Game over!"
            return
          elsif user_choice == 2
            next
          else
            puts "You chickened out and turned around. Mama would be ashamed"
            next
          end
        when "go west"
          puts "You encounter Tom Hanks and Wilson, the inhabitants of the shelter."
          puts "What would you like to do next?"
          puts "1. Fight them"
          puts "2. Run away like a coward"
          print "Enter your choice (1 or 2): "
          user_choice = gets.chomp.to_i
  
          if user_choice == 1
            puts "You engage in a fierce battle with Tom Hanks and Wilson."
            puts "After an intense struggle, you viciously beat Tom Hanks to death with Wilson!"
            puts "Congratulations! You have claimed the shelter! No more Tom, no more Wilson."
          elsif user_choice == 2
            puts "You choose to run away like a coward."
            puts "Tom Hanks chuckles and throws Wilson with a mean Tom Brady-like pass at you, hitting you in the head causing it to explode."
            puts "You die a peasant's death. Game over!"
            return
          else
            puts "Invalid choice. Please try again."
          end
        when "go middle"
          puts "You need to come up with a creative solution to overcome this obstacle."
          puts "What would you like to do next?"
          puts "1. Chill and get something to drink"
          puts "2. Look for a hidden path"
          print "Enter your choice (1 or 2): "
          user_choice = gets.chomp.to_i
  
          if user_choice == 1
            puts "You relax by the serene pool, enjoying the peaceful surroundings."
          elsif user_choice == 2
            puts "Go west, there is some guy over there with a volley ball, you dont like him for some reason.  Seems like he could be a horrible actor making a horrible movie, so you approach with caution"
        else
          puts "Invalid choice. Please try again."
        end
      end
    else
      puts "Invalid choice. Please try again."
    end
  end
end

explore_island