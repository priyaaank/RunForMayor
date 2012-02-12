class AccessConfig
  
  def initialize
    @config = @config = YAML::load(File.open("./4sq_config.yml"))
  end

  def access_token
    @config["access_token"]
  end

end
