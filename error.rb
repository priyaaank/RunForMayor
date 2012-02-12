class Error

  def initialize hash
    @code  = hash["meta"]["code"]
    @error = hash["meta"]["errorDetail"]
  end

  def print_if_error msg
    failure_msg = "FAILED :: #{msg} :: #{@error}"
    puts (@error.nil? ? failure_msg : msg)
  end

end
