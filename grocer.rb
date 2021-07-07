def consolidate_cart(cart)
  consolidate_hash = {}
  cart.each do |item|
    item.each do |item_name, item_hash|
      if consolidate_hash.key?(item_name) == false
        consolidate_hash[item_name] = item_hash
        consolidate_hash[item_name][:count] = 1
      else
        consolidate_hash[item_name][:count] += 1
      end
    end
  end
  consolidate_hash
end

def apply_coupons(cart, coupons)
  if coupons.size <= 0
    return cart
  else
    consolidate_coupon_hash = {}
    more_consolidated_hash = {}
    consolidate_coupon_array = []
    coupons.each do |coupon_hash|
      coupon_name = coupon_hash[:item]
      if consolidate_coupon_hash.key?(coupon_name) == false
        consolidate_coupon_hash[coupon_name] = coupon_hash
      else
        consolidate_coupon_hash[coupon_name][:num] += coupon_hash[:num]
      end
    end
  end
  consolidate_coupon_hash.each do |item_name, item_hash_consolidated|
  consolidate_coupon_array << item_hash_consolidated
end
consolidate_coupon_array.each do |coupon|
  if cart.key?(coupon[:item]) == false
  else
    coupon_name = coupon[:item]
    coupon_number = coupon[:num]
    coupon_cost = coupon[:cost]
    item_clearance = cart[coupon_name][:clearance]
    cart["#{coupon_name} W/COUPON"] = {price: coupon_cost, clearance: item_clearance, count: coupon_number}
    item_in_cart_after_coupons = cart[coupon_name][:count] - coupon_number
    cart[coupon_name][:count] = item_in_cart_after_coupons
    if cart[coupon_name][:count] = <= 0
      cart.delete(coupon_name)
      cart["#{coupon_name} W/COUPON"][:count] = 1
    elsecart["#{coupon_name} W/COUPON"][:count] = 1
    end
  end
end
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
