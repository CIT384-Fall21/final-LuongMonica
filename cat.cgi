#!/bin/bash
GH_URL="https://github.com/CIT384"
FILE="/home/weiss/public_html/index.html"

echo "Content-type: text/html"
echo "x-final.cit384: ${GH_URL}"
echo ""
cat "${FILE}"