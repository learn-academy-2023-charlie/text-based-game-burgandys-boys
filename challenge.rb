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


