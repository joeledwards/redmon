#!/usr/bin/env coffee

Redis = require 'ioredis'
durations = require 'durations'

config = require('fs').readFileSync('redis.json', 'utf-8')

increments = 100000
watch = durations.stopwatch().start()
redis = new Redis(config)

redis.info()

.then (info) ->
  console.log "INFO:\n", info

.then (count) ->
  redis.disconnect()

  console.log "Done in #{watch}"

.catch (error) ->
  console.log "Error getting info from Redis:", error, "\nStack:\n", error.stack

