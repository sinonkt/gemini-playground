ROOT_DIR=$(pwd)
ANNOS_DIR=${ROOT_DIR}/data/annos
VCFS_DIR=${ROOT_DIR}/data/vcfs
DBS_DIR=${ROOT_DIR}/data/dbs

docker run -it \
  -v $VCFS_DIR:/vcfs \
  -v $DBS_DIR:/dbs \
  -v $ANNOS_DIR:/gemini_data \
  sinonkt/docker-gemini
  bash