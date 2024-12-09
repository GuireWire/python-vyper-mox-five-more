# pragma version 0.4.0
# @license MIT
import favorites 
import workshop

initializes: favorites 
initializes: workshop
exports:(favorites.retrieve, favorites.add_person, workshop.get_favorite_animal, workshop.add_people)
# exports: favorites.__interface__ # cant do this!

# what if favorites doesn't have an __init__ function? 
@deploy 
def __init__():
    favorites.__init__()
    workshop.__init__()

@external
def store(favorite_number: uint256):
    # favorites.store(favorite_number) # cant do this!
    favorites.my_favorite_number = favorite_number + 5

@external
def set_favorite_animal(favorite_animal: String[40]):
    # favorites.store(favorite_number) # cant do this!
    workshop.my_favorite_animal = "Elephant"