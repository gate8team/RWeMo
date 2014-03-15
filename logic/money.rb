class Money
  attr_accessor :from_money_code, :to_money_code, :rate

  def initialize params
    @from_money_code = params[:from_money_code]
    @to_money_code = params[:to_money_code]
  end
end