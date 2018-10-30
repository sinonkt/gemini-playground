ROOT_DIR=/home/dev/Code
datetime=$(date -d "today" +"%Y%m%d%H%M")
# NX_CONFIG=${ROOT_DIR}/nextflow.config
LOG_DIR=${ROOT_DIR}/logs/${datetime}
WORK_DIR=${ROOT_DIR}/works/
PROJECT_REPO=sinonkt/gemini-load-nf

# update workflow code every time
nextflow pull $PROJECT_REPO

# -C $NX_CONFIG \
nextflow -log $LOG_DIR/.nextflow.log \
  run $PROJECT_REPO \
  -w $WORK_DIR \
  -resume \
  -with-trace \
  -with-report ${LOG_DIR}/report.html \
  -with-dag ${LOG_DIR}/flowchart.svg \
  -with-timeline ${LOG_DIR}/timeline.html \
  "$@"
