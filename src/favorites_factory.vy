# pragma version 0.4.0
# @license MIT

from interfaces import i_favorites

list_of_favorite_contracts: public(DynArray[i_favorites, 100])
# list_of_favorite_contracts: public(DynArray[i_favorites, 100])
original_favorite_contract:address

# We could create an interface to get the ABI needed for being abble to call def store_from_factory, but this is messy
# interface i_favorites:
#     def store(new_number: uin256): nonpayable

@deploy
def __init__(original_favorite_contract: address):
    self.original_favorite_contract = original_favorite_contract

@external
def create_favorites_contract():
    new_favorites_contract: address = create_copy_of(self.original_favorite_contract)
    # self.list_of_favorite_contracts.append(new_favorites_contract)
    self.list_of_favorite_contracts.append(i_favorites(new_favorites_contract))

@external
def store_from_factory(favorites_index: uint256, new_number: uint256):
    # favorites_address: address = self.list_of_favorite_contracts[favorites_index]
    # favorites_contract: i_favorites = i_favorites(favorites_address)
    favorites_contract: i_favorites = self.list_of_favorite_contracts[favorites_index]
    extcall favorites_contract.store(new_number)

@external
@view
def view_from_factory(favorites_index: uint256) -> uint256:
    return staticcall self.list_of_favorite_contracts[favorites_index].retrieve()
    # The above line is method chaining - It's the same as writing the below:
    # favorites_contract: i_favorites = self.list_of_favorites_contracts[favorites_index]
    # value: uint256 = static call favorites_contract.retrieve()
    # return value
    

    

