# Standalone sidekiq monitor

The [sidekiq dashboard](https://github.com/mperham/sidekiq/wiki/Monitoring) as a standalone app + basic http auth.

## Launch
Before launch, restrict access source by a firewall.

```
bundle exec rackup --host 0.0.0.0 --daemon
```

## License

The code is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
