#!/bin/bash
openssl genrsa -out special.cit384.key 4096
openssl req -new -out special.cit384.csr -sha256 -key special.cit384.key -subj "/C=US/ST=California/L=Northridge/O=CIT384/OU=DogeSmirk/CN=special.cit384"
openssl x509 -req -in special.cit384.csr -days 365 -signkey special.cit384.key -out special.cit384.cert -outform PEM

openssl genrsa -out mywebsite.cit384.key 4096
openssl req -new -out mywebsite.cit384.csr -sha256 -key mywebsite.cit384.key -subj "/C=US/ST=California/L=Northridge/O=CIT384/OU=DogeSmirk/CN=mywebsite.cit384"
openssl x509 -req -in mywebsite.cit384.csr -days 365 -signkey mywebsite.cit384.key -out mywebsite.cit384.cert -outform PEM

openssl genrsa -out final.cit384.key 4096
openssl req -new -out final.cit384.csr -sha256 -key final.cit384.key -subj "/C=US/ST=California/L=Northridge/O=CIT384/OU=DogeSmirk/CN=final.cit384"
openssl x509 -req -in final.cit384.csr -days 365 -signkey final.cit384.key -out final.cit384.cert -outform PEM