VERSION=1.11.1
OS=linux
ARCH=amd64
USER=$(whoami)
APP_HOME=/colossus/home/${USER}/usr/local
GOPATH=/colossus/home/${USER}/go
PATH=${APP_HOME}/bin:${APP_HOME}/go/bin:${PATH}:${GOPATH}/bin

# Install Go lang
mkdir bin
mkdir -p $APP_HOME
wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz && \
             tar -C $APP_HOME -xzf go$VERSION.$OS-$ARCH.tar.gz && \
             rm -f go$VERSION.$OS-$ARCH.tar.gz

# Compile && Install Singularity
mkdir -p $GOPATH/src/github.com/sylabs && \
  cd $GOPATH/src/github.com/sylabs && \
  git clone https://github.com/sylabs/singularity.git && \
  cd singularity && \
  go get -u -v ${GOPATH}/src/github.com/golang/dep/cmd/dep && \
  ./mconfig && \
  make -C builddir && \
  make -C builddir install

# Install Nextflow binary under uer dev and Configure Dir for dev
cd ~
wget -qO- https://get.nextflow.io | bash
mv nextflow ${HOME}/bin

# Install AWS cli
pip install awscli --upgrade --user

# Install VT
scl enable devtoolset-7 bash
git clone https://github.com/atks/vt.git
cd vt && make && make test

# Install gemini
TOOLS_DIR=${HOME}/opt
DATA_DIR=${HOME}/
MINICONDA_PREFIX=${HOME}/anaconda
PATH=${MINICONDA_PREFIX}/bin:$PATH

mkdir $TOOLS_DIR
yum -y install python-argparse python27 git wget gcc gcc-c++ zlib-devel

wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
chmod u+x Miniconda2-latest-Linux-x86_64.sh
./Miniconda2-latest-Linux-x86_64.sh -b -p $MINICONDA_PREFIX
conda install --yes -c conda-forge -c bioconda gemini

wget https://raw.github.com/arq5x/gemini/master/gemini/scripts/gemini_install.py
python gemini_install.py $TOOLS_DIR $DATA_DIR

rm -f gemini_install.py Miniconda2-latest-Linux-x86_64.sh

# clone gemini-playground
cd ~
git clone https://github.com/sinonkt/gemini-playground.git