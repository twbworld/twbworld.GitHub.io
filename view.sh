#!/usr/bin/env bash

hugo --i18n-warnings server

#外部访问
#hugo --i18n-warnings server -D --bind 192.168.2.2 -p 1314 --baseURL=http://192.168.2.2:1314
