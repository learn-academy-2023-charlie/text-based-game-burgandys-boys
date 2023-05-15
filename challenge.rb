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
=======
# Establish the different items to be searched and their contents
$luggage = {survivalkit: 'medical supplies', plasticbag: 'flint', pouch: 'hunting knife'}
$dresser = {firstdrawer: 'clean, but wet, clothes', seconddrawer: 'alcohol'}
$rose_body = {locket: 'a picture of us as a couple'}

# Establish the user inventory
$user_items = {}
$item_count = 0

# Base variables for user inputs
user_response = ""
searched_item = ""


# Determines if the user is interested in searching more
def investigating (response)

    # If they say yes, the items on the beach are listed and they are pushed to the searching items block
    if response == 'y'
        p 'You found luggage, a tattered dresser, a stack of planks, and Roses body'
        p 'Would you like to search any of these? y or n'
        user_response = gets.chomp.downcase
        searching_beach (user_response)
    
    # If they say no, they die and the game ends
    else
        p 'Congrats! You died. Excellent job.'
    end

end


def searching_beach (response)

    # If they said yes to searching
    if response == 'y'
        p 'What do you want to search? Type luggage, dresser, planks, or Rose'
        searched_item = gets.chomp.downcase
        while searched_item != 'luggage' && searched_item != 'dresser' && searched_item !=  'planks' && searched_item !=  'rose'
            p 'Im sorry, that didnt match anything we are seeing. Please try again'
            searched_item = gets.chomp.downcase
            item_container(searched_item)
        end
        item_container(searched_item)
    else
        ready_to_move
    end
end

def item_container (item)

    continue = 'y'

    if continue == 'y'
        if item == 'luggage'
            p "You found #{$luggage.values} in the #{item}"
            p 'You stored them away for later'
            $user_items[item] = $luggage.values
            $user_items =+ 1
        elsif item == 'dresser'
            p "You found #{$dresser.values} in the #{item}"
            p 'You stored them away for later'
            $user_items[item] = $dresser.values
            $user_items =+ 1
        elsif item == 'planks'
            p 'Doesnt seem to be anything here, but they could come in handy later'
            $user_items =+ 1
        else
            p "You found #{$rose_body.values} on Roses body"
            p 'You stored them away for later'
            $user_items[item] = $rose_body.values
            $user_items =+ 1
        end

        p 'Do you want to search anything else? Type y or n'
        continue = gets.chomp.downcase
        searching_beach(continue)
    end

end

def ready_to_move
    p 'Are you ready to leave the beach? Type y or n'

    ready_move = gets.chomp.downcase

    if ready_move == 'y'
        if $user_items < 3
            p 'Congrats! You forgot to search everything and died a tragic death. Way to go!'
            p 'Try again? Type y or n'
            try_again = gets.chomp.downcase
            investigating(try_again)
        else
            p 'You collect all your things and move inland'
        end
    else
        p 'You didnt move fast enough! You get eaten by a shark. Well done...'
    end

end

p 'Years after falling off of a cruise in the bahamas, you decide its time to give it another shot. You book a cruise to Alaska, and wouldnt you know it, the boat hits an iceberg and sinks straight to the ground. The last think you remember is falling off the side of the boat with your fiance, Rose. You wake up alone on a deserted beach, with remnants from the cruise scattered around you.'
p 'Have a look around? Type y or n'
user_response = gets.chomp.downcase

investigating (user_response)


