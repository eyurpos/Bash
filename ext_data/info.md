# Fetch external data

## Curl
> sudo apt-get install curl

> curl '[url]'

> curl '[url]' -v - verbose

> curl '[url]' -o [output_file]

> curl '[url]' -L - redirect

> curl '[url]' -s - silent

> curl '[url]' > /dev/tty

## WGET
> sudo apt install wget

> wget '[url]' 

> wget -O newname.zip '[url]' - set name

> wget -r '[url]' - recursively

> wget -q '[url]'  - quite

> wget -b '[url]'  - background

## checksum
- MD5:
> md5sum filename
- SHA-1:
> sha1sum filename
- SHA-256:
> sha256sum filename

## JSON

https://www.w3schools.com/js/js_json_intro.asp

## jq
> sudo apt-get install jq

> jq '.field'

> jq '[.field]'

> jq '[.field1, .field2]'
