#!/usr/bin/env bash -x

function generateSSLConf () {
	if [[ $1 == *plad* ]] ; then
		echo $1
cat << EOF > "$1.$2.cnf"
[ req ]
distinguished_name = req_distinguished_name
req_extensions = req_ext

[ req_distinguished_name ]

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = $1-data.$2.agauli.com
EOF

	else
cat << END > "$1.$2.cnf"
[ req ]
distinguished_name = req_distinguished_name
req_extensions = req_ext

[ req_distinguished_name ]

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = $1.$2.agauli.com
DNS.2 = $1.uw1.$2.agauli.com
DNS.3 = $1.uw2.$2.agauli.com
DNS.4 = $1.ue1.$2.agauli.com
DNS.5 = $1.ue2.$2.agauli.com
DNS.6 = $1.ew1.$2.agauli.com
DNS.7 = $1.an1.$2.agauli.com
DNS.8 = $1.as1.$2.agauli.com
DNS.9 = $1.as2.$2.agauli.com
DNS.10 = $1-blue.$2.agauli.com
DNS.11 = $1-green.$2.agauli.com
DNS.12 = $1-gray.$2.agauli.com
DNS.13 = $1.en1.$2.agauli.com
END
fi
}

function generateCerts ()
{
	APP_NAME=$1
	ENV_NAME=$2
	openssl req -new -newkey rsa:2048 -sha256 -keyout $1.$2.agauli.com.key.pem -subj "/CN=$1.$2.agauli.com" -config $1.$2.cnf -passout pass:ag_aws -out  $1.$2.agauli.com.csr
	openssl rsa -in $1.$2.agauli.com.key.pem -out $1.$2.agauli.com.key-without-pass.pem -passin pass:ag_aws
}

