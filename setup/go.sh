#! /bin/sh

bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

go get github.com/motemen/ghq
go get github.com/peco/peco/cmd/peco
