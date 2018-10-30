SHARE=/share/apps

# Nextflow && Singularity
USER=$(whoami)
HOME=/colossus/home/${USER}
APP_HOME=${HOME}/usr/local
GOPATH=${HOME}/go
PATH=${APP_HOME}/bin:${APP_HOME}/go/bin:${PATH}:${GOPATH}/bin:${HOME}/bin

# GEMINI Dependencies
HTS_LIB=${SHARE}/htslib-1.8
SNPEFF_HOME=${SHARE}/snpEff_4.3t
SNPEFF_JAR=${SHARE}/snpEff_4.3t/snpEff.jar
VCF_TOOLS=${SHARE}/vcftools_0.1.12b/perl
VT=${HOME}/vt
GEMINI=${HOME}/gemini/bin
export PATH=$HTS:$VCF_TOOLS:$VT:$GEMINI:${HOME}/anaconda/bin:$PATH