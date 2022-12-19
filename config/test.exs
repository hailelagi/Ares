import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ares, AresWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "rq2VMEqRvkXPh6s0Pus9eK8Qi7fx14LKlp0nBQto+ef3Lo5l9318AWnpgLxbSp7C",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
