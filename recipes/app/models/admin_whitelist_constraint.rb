class AdminWhitelistConstraint

  def matches?(request)
    whitelist.include?(request.remote_ip)
  end

  private

  def whitelist
    array = []
    AdminWhitelist.all.each {|list| array << list[:remote_ip]}
    array
  end
end
