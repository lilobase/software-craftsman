class DataStore
  def request_with_condition table, condition
    "SELECT FROM #{table} WHERE #{condition}" #dummy example
  end
end

#before refactoring
data_store = DataStore.new
user_over_18 = data_store.request_with_condition('user', 'age > 18')
user_below_18 = data_store.request_with_condition('user', 'age < 18')
user_without_email = data_store.request_with_condition('user', 'email = NULL')

#after refactoring
user_request = DataStore.new.method(:request_with_condition).curry.call('user')
user_over_18 = user_request.call('age > 18')
user_below_18 = user_request.call('age < 18')
user_without_email = user_request.call('email = NULL')
