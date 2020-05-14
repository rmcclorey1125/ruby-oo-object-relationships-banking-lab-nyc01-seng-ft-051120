require 'pry'

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?

  end

  def execute_transaction
      # binding.pry
      if self.valid?  && sender.balance > amount && self.status == "pending"
        @sender.balance -= amount
        @receiver.balance += amount
        @status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
  end

  # def execute_transaction
  #   if  @status != "complete" && self.valid?
  #     @sender.balance -= amount
  #     @receiver.balance += amount
  #     @status = "complete"
  #   end
  # end

  def reverse_transfer
    if  @status == "complete"
      @status = "reversed"
      @receiver.balance -= amount
      @sender.balance += amount
    end
  end

end
