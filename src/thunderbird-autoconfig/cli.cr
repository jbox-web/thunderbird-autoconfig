module ThunderbirdAutoconfig
  # :nodoc:
  class CLI < Admiral::Command
    class Server < Admiral::Command
      define_help description: "Run ThunderbirdAutoconfig webserver"

      define_flag config : String,
        description: "Path to config file",
        long: "config",
        short: "c",
        default: "thunderbird-autoconfig.yml"

      def run
        ThunderbirdAutoconfig.load_config(flags.config)
        ThunderbirdAutoconfig.setup_log
        ThunderbirdAutoconfig.setup_signals
        ThunderbirdAutoconfig.start_server
      end
    end

    class Info < Admiral::Command
      define_help description: "Show ThunderbirdAutoconfig information"

      def run
        puts "version: #{ThunderbirdAutoconfig.version}"
        puts
        puts "crystal:"
        puts Crystal::DESCRIPTION
        puts
      end
    end

    define_version ThunderbirdAutoconfig.version
    define_help description: "ThunderbirdAutoconfig in Crystal"

    register_sub_command info, Info, description: "Show ThunderbirdAutoconfig information"
    register_sub_command server, Server, description: "Run ThunderbirdAutoconfig webserver"

    def run
      puts help
    end
  end
end
