#!/bin/bash

ports=(8080 8082 8083 8084 8085 8086 5432 2181 9092)
descriptions=("UI" "Fight REST API" "Hero REST API" "Villain REST API" "Statistics REST API" "Narration REST API" "Postgres" "Zookeeper" "Kafka")

for i in ${!ports[@]}; do
  port=${ports[$i]}
  description=${descriptions[$i]}
  if lsof -i tcp:$port > /dev/null; then
    echo "Port $port ($description) is in use."
  else
    echo "Port $port ($description) is free."
  fi
done

