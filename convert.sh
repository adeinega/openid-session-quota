#!/usr/bin/env sh

set -e

mmark openid-session-quota-1.0.md > openid-session-quota-1.0.xml

xml2rfc openid-session-quota-1.0.xml --text --html --v3
