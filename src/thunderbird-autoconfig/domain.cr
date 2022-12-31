module ThunderbirdAutoconfig
  # :nodoc:
  class Domain
    include YAML::Serializable

    property name : String
    property template : String
  end
end
