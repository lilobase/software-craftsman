#===== Definition
def sum_with(x)
  ->(y){x+y} #this is the short syntax to build lambda in ruby
end

sum_with_4 = sum_with(4)
sum_with_4.call(3) #return 7
sum_with_4.call(2) #return 6

#===== Example of partial application for DI
def make_logger(logger_implementation)
  ->(message){logger_implementation.log(message)}
end

#you can choose and easily change the logger implementation
logger = make_logger(DatabaseLogger.new)
logger = make_logger(FileLogger.new)

logger.call('a debug message')

#===== Example of partial application for filtering/displaying
def get_unpaid_invoices_by_user user_id
  ->(order_by){ "SELECT FROM invoices WHERE user_id = #{user_id} ORDER BY #{order_by}" }
end

unordered_invoices = get_unpaid_invoices_by_user 1

ordered_by_date = unordered_invoices.call('issue_date')
ordered_by_amount = unordered_invoices.call('amount')
#...

class SqlDataStore
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
