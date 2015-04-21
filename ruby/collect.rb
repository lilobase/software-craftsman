class Bridge
  def to_alternatives offers
    alternatives = []
    offers.each do |offer|
      alternatives << to_alternative(offer)
    end
    alternatives
  end

  def to_alternative offer
    #some treatment to transform an offer to an alternative
  end
end

class Bridge
  def to_alternatives offers
    offers.collect do |offer|
      to_alternative(offer)
    end
  end

  def to_alternative offer
    #some treatment to transform an offer to an alternative
  end
end

#===== pattern
new_array = []
array.each do |item|
  new_array << do_something(item)
end
new_array

new_array = []
for item in array
  new_array << do_something(item)
end
new_array

array.collect do |item|
  do_something(item)
end