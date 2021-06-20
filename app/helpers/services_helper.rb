module ServicesHelper

  def region(code)
    CS.states(:cl).select{|k, v| k == code.to_sym }.values.first
  end

end
