#!/usr/bin/env bash

hugo server --disableFastRender --i18n-warnings

#外部访问
#hugo server --i18n-warnings --disableFastRender -D --bind 192.168.2.2 -p 1314 --baseURL=http://192.168.2.2:1314
