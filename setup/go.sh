#! /bin/sh

git clone https://github.com/riywo/anyenv ~/.anyenv

# gcloud
curl curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-114.0.0-darwin-x86_64.tar.gz > ~/Downloads/gcloud.tar.gz
tar zxvf ~/Downloads/gcloud.tar.gz
mv ~/Downloads/google-cloud-sdk ~/google-cloud-sdk
./google-cloud-sdk/install.sh

go get github.com/motemen/ghq
go get github.com/peco/peco/cmd/peco
