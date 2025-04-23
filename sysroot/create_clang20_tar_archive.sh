
UPLOAD_DIR="/data/www/myhomepage/htdocs/files/public/Android"

CUR_VERSION="$( grep "^[0-9]" README_clang20  | tail -1 | tr " " "_" )"

eval CUR_VERSION=${CUR_VERSION}

if [ "$1"x = "release"x ] ; then
	POSTFIX="release"
else
	POSTFIX="$$"
fi

TAR_FILE_NAME="clang20_for_Android_${CUR_VERSION}-${POSTFIX}.tar.gz"

TAR_FILE="$( cd .. && pwd )/${TAR_FILE_NAME}"

FILES_FOR_THE_TAR_ARCHIVE="
sysroot/README_clang20
sysroot/bin/init_clang20_env
sysroot/create_clang20_tar_archive.sh
sysroot/usr/clang20
sysroot/usr/ndk/r29-beta1
sysroot/usr/share/clang20
"

sed -i -e "s#tar -xf /sdcard/Download/.*#tar -xf /sdcard/Download/${TAR_FILE_NAME}#" README_clang20

echo "Creating the tar archive \"${TAR_FILE}\" ..."
(cd .. && ${PREFIX} tar -czf "${TAR_FILE}"  ${FILES_FOR_THE_TAR_ARCHIVE} )

ls -l  "${TAR_FILE}"

if [ -d "${UPLOAD_DIR}" ] ; then
  echo "Press y<return> to copy the file ${TAR_FILE} to ${UPLOAD_DIR} ..."
  read USER_INPUT
  if [ "${USER_INPUT}"x = "y"x -o "${USER_INPUT}"x = "a"x  ] ; then
	set -x
	cp "${TAR_FILE}"  "${UPLOAD_DIR}" 
	set +x
  fi
fi

echo "Pess y<return> to copy the file ${TAR_FILE} to /sdcard/Download on the phone attached via USB ..."
read USER_INPUT
if [ "${USER_INPUT}"x = "y"x -o "${USER_INPUT}"x = "a"x  ] ; then
   set -x
   adb -d push "${TAR_FILE}" /sdcard/Download 
   set +x
fi

