module ThunderbirdAutoconfig
  # :nodoc:
  class Config
    include YAML::Serializable

    property domains : Array(ThunderbirdAutoconfig::Domain) = [] of ThunderbirdAutoconfig::Domain
    property log_file : String = "stdout"
    property server_host : String = "127.0.0.1"
    property server_port : Int32 = 3000
    property server_environment : String = "production"
  end
end
