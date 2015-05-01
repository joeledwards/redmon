Redis = require 'ioredis'
durations = require 'durations'

config =
  sentinels: [(
    host:
      "localhost"
    port:
      26379
  )]
  name:
    "nda"

console.log "config:", config

increments = 100000
watch = durations.stopwatch()
redis = new Redis(config)

redis.info()

.then (info) ->
  console.log "INFO:\n", info
  pipeline = redis.pipeline()
  watch.start()
  pipeline.incr "count" for v in [0 .. increments]
  pipeline.exec()

.then (result) ->
  watch.stop()
  console.log increments, "increments took", watch.format()
  redis.get "count"

.then (count) ->
  console.log "count:", count
  redis.disconnect()

.catch (error) ->
  console.log "Error getting info from Redis:", error, "\nStack:\n", error.stack

