require 'pry'

class BankAccount
    attr_reader :name, :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        binding.pry
        # @status = status
    end

end
