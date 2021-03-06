ROOT_DIR=$(pwd)
ANNOS_DIR=${ROOT_DIR}/data/annos
VCFS_DIR=${ROOT_DIR}/data/vcfs
DBS_DIR=${ROOT_DIR}/data/dbs

docker run -it \
  --name gemini \
  -v $VCFS_DIR:/vcfs \
  -v $DBS_DIR:/dbs \
  -v $ANNOS_DIR:/gemini_data \
  -v ${ROOT_DIR}/bin:/root \
  -p 8080:8080 \
  sinonkt/docker-gemini \
  bash