# class Integer
#   # Integer#hash already implemented for you
# end

# class Array
#   def hash
#     hash_value = 0
#     self.each_with_index do |ele, i|
#       hash_value += ele.hash * i
#     end
#     hash_value
#   end
# end

# class String
#   def hash
#     hash_value = 0
#     self.each_char.with_index do |char, i|
#     hash_value += char.ord.hash / (i + 1)
#     end
#     hash_value
  
#   end
# end

# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
#     results = []
#     self.each do |k,v|
#       results << [k,v]
#     end 

#     hash_value = 0
#     results.each_with_index do |ele, i|
#       hash_value += ele.hash * i
#     end
#     hash_value
#   end
# end
