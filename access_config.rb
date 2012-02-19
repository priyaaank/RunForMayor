class AccessConfig
  
  def initialize
    @config = @config = YAML::load(File.open("./config/4sq_config.yml"))
  end

  def access_token
    extract "access_token"
  end

  def city
    extract "city"
  end

  private

  def extract key
    @config[key] || ""
  end

end
