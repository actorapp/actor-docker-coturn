#!/bin/bash
set -eu

if [ ! "${GETH_DATA:-}" ]; then
	echo "Please, set GETH_DATA environment variable!"
	exit 1
fi

if [ "${GETH_GENESIS:-}" ]; then
	/usr/bin/geth init --datadir=$GETH_DATA $GETH_GENESIS
fi

exec /usr/bin/geth --datadir=$GETH_DATA "$@"