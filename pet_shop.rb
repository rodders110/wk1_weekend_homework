def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(hash, amount)
  hash[:admin][:total_cash] += amount
  return hash[:admin][:total_cash]
end

def pets_sold(hash)
  return hash[:admin][:pets_sold]
end

def increase_pets_sold (hash, amount)
  hash[:admin][:pets_sold] += amount
end
def stock_count(hash)
  count = hash[:pets].count()
  return count
end

def pets_by_breed (hash, breed)
  pets = []
  for pet in hash[:pets]
    if (pet[:breed] == breed)
      pets << pet
    end
  end
  return pets
end


def find_pet_by_name (hash, name)
  for pet in hash[:pets]
    if (pet[:name]== name)
      return pet
    end
  end
  return nil
end

def remove_pet_by_name (hash, name)
  hash[:pets].delete(find_pet_by_name(hash, name))
end

def add_pet_to_stock (hash, addition)
  hash[:pets].unshift(addition)
end

def customer_cash(array)
  array[:cash]
end

def remove_customer_cash (customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customers)
  customers[:pets].count
end

def add_pet_to_customer (customer, pet)
  array = customer[:pets]
  array << pet
end

def customer_can_afford_pet (customer, pet)
  if (customer[:cash] >= pet[:price])
    return true
  else
    return false
  end
end

def sell_pet_to_customer (hash, pet, customer)
  if (pet != nil && customer[:cash] >= pet[:price] )
    add_pet_to_customer(customer, pet)
    customer[:cash] -= pet[:price]
    hash[:admin][:total_cash] += pet[:price]
    hash[:admin][:pets_sold] += 1
    remove_pet_by_name(hash, pet[:name])
  end
end
