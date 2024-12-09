# pragma version 0.4.0
# @license MIT

struct Person:
    favorite_animal: String[40]
    name: String[100]

my_favorite_animal: public(String[40])

# Mappings to replace array of strings
list_of_animals_set: public(HashMap[uint256, String[40]])
list_of_people: public(Person[5])
list_of_people_index: uint256

name_to_favorite_animal: HashMap[String[100], String[40]]

@deploy
def __init__():
    self.my_favorite_animal = "Giraffe"

@external
def set_favorite_animal(favorite_animal: String[40]):
    self.my_favorite_animal = favorite_animal

@external
@view
def get_favorite_animal() -> String[40]:
    return self.my_favorite_animal

@external
def add_people(name: String[100], favorite_animal: String[40]):
    new_person: Person = Person(favorite_animal=favorite_animal, name=name)
    self.list_of_people[self.list_of_people_index] = new_person
    self.list_of_animals_set[self.list_of_people_index] = favorite_animal  # Use HashMap for dynamic storage
    self.list_of_people_index += 1
    self.name_to_favorite_animal[name] = favorite_animal
