#!/bin/bash
set -e
jar='jmx_prometheus_httpserver-*.jar'
java ${JVM_OPTS:--Xmx512m} -jar $jar 9138 "$@"
