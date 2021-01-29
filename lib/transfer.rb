class Transfer
  # your code here
  attr_accessor :status, :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @amount = amount
    @status = 'pending'
    @sender = sender
    @receiver = receiver
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if @status == 'pending' && valid? && self.sender.balance > @amount
      self.sender.balance -= @amount
      self.receiver.balance += @amount
      @status = 'complete'
    else
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      self.sender.balance += @amount
      self.receiver.balance -= @amount
      @status = 'reversed'
    end
  end

end
