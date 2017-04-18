# Database hahaha
class Database
  def self.transaction
    puts 'open transaction'
    yield
    puts 'rollback transaction'
  end
end
