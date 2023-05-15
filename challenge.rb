# Text-based Game Challenge
puts "Your exploration has paid off! You appear to have found a nice area to shelter you from the elements. It might be a good idea to explore the area, would you like to do that now? (yes or no)"
explore_shelter = {rest_area: 'A nice spot to sleep in', food: 'Some edible looking berries in the surrounding brush', fireplace: 'A ring of rocks that looks like it was used to make a fire', path: 'A path towards the sounds of the waterfall'}
 
choice = gets.chomp
if choice.include? 'y'
    puts 'This is what you find: '
    puts explore_shelter[:rest_area]
    puts explore_shelter[:food]
    puts explore_shelter[:fireplace]
    puts explore_shelter[:path]
elsif choice.include? 'go back'
    puts 'You ran headfirst into the panther that was stalking you. You died.'
elsif choice.include? 'n'
    return puts "You decide to head back to the beach instead. On the way, you run head-first into a panther that was stalking you. You died."
end
puts "What would you like to do now?"
choice1 = gets.chomp
if choice1.include? 'nap'
    puts 'You head over to the comfy corner and sleep for the rest of the night'
elsif choice1.include? 'sleep'
    puts 'You head over to the comfy corner and sleep for the rest of the night'
elsif choice1.include? 'berries'
    puts 'You head outside and gather the berries. You were STRAVING and had not even realized it yet.'
elsif choice1.include? 'rock'
    puts 'Hmm. We are going to need something to burn if we are going to make a fire. Perhaps there is something to burn back at the beach. Head back to the beach?'
    choice2 = gets.chomp
    if choice2.include? 'y'
        puts 'At the beach, you gather any and all flammable materials, and bring them to your campsite. As you start your fire, you realize that it is giving off a lot of smoke...to much smoke. Maybe even enough to make a signal fire. Gather more resources to make a larger fire?' 
        choice3 = gets.chomp
        if choice3.include? 'y'
            puts 'You are getting ready to head out, but decide last minute that it is getting dark. You decide to sleep the night by your fire, and set you to gether resources in the morning.'
        else
            puts 'You decide its getting too dark to wander around the island at night. You hunker down in your shelter and sleep through the night.'
        end
        puts "Morning sun hits your face. You are ready to gather your materials. Head out to the beach?"
        choice4 = gets.chomp
        if choice4.include? 'y'
            return puts "You gather materials and before long, you have a towering inferno blazing. Won't be long now before the rescue crews arrive. Now, you wait. Congratulations, you survived your second shipwreck!!"
        else
            return puts 'You failed to realize you were being stalked in the night. As you step outside of the shelter, you are eaten by a panther!'
        end
    elsif choice2.include? 'no'
        return puts 'You decide to stay put for the night. Not realizing that the island you are on drops to inhabitable temperatures during the night. You go to sleep and never wake up.'
    end
end

puts 'Ok, what can you do now to survive?'
    choice1 = gets.chomp
