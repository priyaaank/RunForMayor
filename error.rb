class Error

  def initialize hash
    @code  = hash["meta"]["code"]
    @error = hash["meta"]["errorDetail"]
  end

  def print_if_error msg
    unless @error.nil?
      puts "FAILED :: #{msg} :: #{@error}"
    end
  end

end
