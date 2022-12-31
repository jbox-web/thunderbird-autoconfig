module ThunderbirdAutoconfig
  class Server
    get "/" do
      "ThunderbirdAutoconfig root"
    end

    get "/mail/config-v1.1.xml" do |env|
      process(env)
    end

    private def self.process(env)
      email_address = env.params.query["emailaddress"]?
      respond_with(env, email_address)
    end

    private def self.respond_with(env, email_address)
      env.response.content_type = "application/xml"
      render_config(email_address)
    end

    private def self.render_config(email_address)
      if !email_address.nil? && !email_address.empty?
        domain_name = email_address.split("@").last
        config = ThunderbirdAutoconfig.config.domains.find { |d| d.name == domain_name }.not_nil!
        Crinja.render(config.template, {"email_address" => email_address})
      else
        "no email_address"
      end
    end
  end
end
