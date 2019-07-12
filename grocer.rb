def consolidate_cart(cart)
  item_list = {}
  cart.each do |x|
    x.each do |item, attribute|
     if item_list.key?(item) == false
       item_list[item] = attribute
       item_list[item][:count] = 1
      else
       item_list[item][:count] += 1
      end 
    end
  end
  return item_list
end  


def apply_coupons(cart, coupons)
  item_list = {}
  cart.each do |x|
    x.each do |key, value|
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here












