require 'pry'
def id_best_users(*args)
  valid_users, merged_users = {}, args.flatten
  merged_users.uniq.each do |x|
    args.all? {|y| y.include?(x)} ? valid_users.has_key?(merged_users.count(x)) ? valid_users[merged_users.count(x)] << x : valid_users[merged_users.count(x)] = [x] : nil
  end
  valid_users.each_value {|value| value.sort!}.to_a.sort.reverse
end

a1 = ['A042', 'B004', 'A025', 'A042', 'C025']
a2 = ['B009', 'B040', 'B004', 'A042', 'A025', 'A042']
a3 = ['A042', 'A025', 'B004']
p id_best_users(a1, a2, a3)

# REQUIREMENT LEFT: SORT BY ALPHABETICAL ORDER keys

# every user gets an IDD# ex. D085
# determine the total number of purchases of the users in all given months

# requirement: user must be in all arrays to be considered for toplist
# output : [n_purchases, [user_ids]]