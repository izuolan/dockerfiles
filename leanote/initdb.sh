#! bin/sh
echo "Loading...."
sleep 5
mongorestore -h mongo -d leanote --dir /mongodb_backup/leanote_install_data/
