# pragma version 0.4.0
# @license MIT

import favorites

initializes: favorites

@deploy 
def __init__():
    favorites.__init__()

@external
def add_person_to_favorites(name: String[100], favorite_number: uint256):
    favorites.name_to_favorite_number[name] = favorite_number

@external
@view
def get_favorite_number(name: String[100]) -> uint256:
    return favorites.name_to_favorite_number[name]
