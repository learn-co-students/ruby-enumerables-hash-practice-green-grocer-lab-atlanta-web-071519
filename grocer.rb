def consolidate_cart(cart)
  receipt = Hash.new
  count=0
  cart.each do |w|
    w.each do|key, value|
      receipt[key] ||= value
      receipt[key][:count] ||=0
      receipt[key][:count] +=1
    end
  end
  receipt
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
        coupon_line = {
          price: coupon[:cost]/coupon[:num],
          clearance: "",
          count: coupon[:num]
        }

        if cart.include?(coupon[:item])
          item = coupon[:item]
          coupon_line[:clearance] = cart[item][:clearance]

          if cart[item][:count] >= coupon_line[:count]
            cart[item][:count] = cart[item][:count]-coupon[:num]
          end
          
          if cart.include?(coupon[:item]+' W/COUPON')
            coupon_line[:count] += coupon[:num]
          end

          puts "Coupon line: #{coupon_line}"

          cart[item + " W/COUPON"] = coupon_line

        end
    end

    return cart
end


def apply_clearance(cart)
  cart.map do |food, info|
    if cart[food][:clearance] == true
      cart[food][:price]= (cart[food][:price]*0.8).round(2)
    end
  end
    cart
end

def checkout(cart, coupons)
  cart=consolidate_cart(cart)
  cart=apply_coupons(cart, coupons)
  cart=apply_clearance(cart)
  total = 0
  cart.each do |food, info|
    total = total + (info[:price]) *info[:count].to_f
  end
  if total>100
    total = total*0.9
  end
  return total
end