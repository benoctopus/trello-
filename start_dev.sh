
HERE="`dirname \"$0\"`"
HERE="`( cd \"$HERE\" && pwd )`"
SERVER=$HERE/server/
CLIENT=$HERE/web/

if [ -z "$SERVER" ] ; then
  exit 1
fi

if [ -z "$CLIENT" ] ; then
  exit 1
fi

export SERVER
export CLIENT
docker-compose up
