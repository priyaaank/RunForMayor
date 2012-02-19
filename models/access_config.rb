class AccessConfig
  
  def initialize
    @config = YAML.load(ERB.new(File.read("./config/4sq_config.yml")).result)
  end

  def access_token
    extract "access_token"
  end

  def city
    extract "city"
  end

  def webhook_secret
    extract "webhook_secret"
  end

  private

  def extract key
    @config[key] || ""
  end

end
