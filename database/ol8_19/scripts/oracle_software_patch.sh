# This patch script should only be used for a clean installation.
# It doesn't patch existing databases.
echo "******************************************************************************"
echo "Patch Oracle Software." `date`
echo "******************************************************************************"
 
# Adjust to suit your patch level.
export PATH=${ORACLE_HOME}/OPatch:${PATH}
export OPATCH_FILE="p6880880_190000_Linux-x86-64.zip"
export PATCH_FILE="p35370174_190000_Linux-x86-64.zip"
export PATCH_TOP=${SOFTWARE_DIR}/35370174
export PATCH_PATH1=${PATCH_TOP}/35320081
export PATCH_PATH2=${PATCH_TOP}/35354406


echo "******************************************************************************"
echo "Prepare opatch." `date`
echo "******************************************************************************"

cd ${ORACLE_HOME}
unzip -oq ${SOFTWARE_DIR}/${OPATCH_FILE}

echo "******************************************************************************"
echo "Unzip software." `date`
echo "******************************************************************************"

cd ${SOFTWARE_DIR}
unzip -oq ${PATCH_FILE}

echo "******************************************************************************"
echo "Apply patches." `date`
echo "******************************************************************************"

cd ${PATCH_PATH1}
opatch prereq CheckConflictAgainstOHWithDetail -ph ./
opatch apply -silent

cd ${PATCH_PATH2}
opatch prereq CheckConflictAgainstOHWithDetail -ph ./
opatch apply -silent

rm -Rf ${PATCH_TOP}
rm -f ${OPATCH_FILE}
rm -f ${PATCH_FILE}
