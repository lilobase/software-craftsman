#Reduce

#Presentation
(1..9).times.reduce(0) do |sum, i|
  sum + i
end

(1..9).times.reduce(:+)

(1..9).reduce(1, :*)

#Before refactoring
def compute_total_amount invoices
  sum = 0
  invoices.each do |invoice|
    sum + invoice.amount
  end
  sum
end

def build_config_hash config_lines
  config_hash = {}
  config_lines.each do |line|
    config_hash[configKey(line)] = configValue(line)
  end
  config_hash
end


#After refactoring
def compute_total_amount invoices
  invoices.reduce(0) do |sum, invoice|
    sum + invoice.amount
  end
end

def build_config_hash config_lines
  config_lines.reduce({}) do |config_hash, line|
    config_hash[configKey(line)] = configValue(line)
    config_hash
  end
end

def build_config_hash config_lines
  config_lines.reduce({}) do |config_hash, line|
    config_hash.tap { |c| c[configKey(line)] = configValue(line) }
  end
end

longest = %w{ cat sheep bear }.inject do |memo, word|
  memo.length > word.length ? memo : word
end