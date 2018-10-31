# Gemini Playground
Containerized Style playground. Required only Docker and time waiting when first time spawn session. <br/>
opinionated scripts to managed multiple nextflow based gemini-loading, spawn gemini session(web) for playaround wit query

### Prerequisite
- Docker for Mac / Docker for Windows: [Official site](https://www.docker.com/products/docker-desktop)
- git: follow Installation guide from [bitbucket tutorial](https://www.atlassian.com/git/tutorials/install-git) or [main site](https://git-scm.com/downloads)
### Usage (Exploration & Investigation mode)
- clone this repository to your machine
  ```
  git clone https://github.com/sinonkt/gemini-playground.git
  cd gemini-playground
  mkdir -p data/dbs
  ```
- get portable database files (eg. `test.db`, `joint.db`, `g1k.db`), which ready for query, from lab members.
- then move db files to `./data/dbs` directory, we just created.
- start gemini web interface at `rootDir` of `gemini-playground`
  ```
  ./bin/spawn-gemini-web.sh ${your_interested_db_name}.db    # for example g1k.db
  ```
- browse web at http://localhost:8080
- when you are done with your exploration.
  ```
  ./bin/stop-gemini.sh
  ```
  
*Notes, Builtin module is not available on web interface.
*So, For hardcore user you can spawn gemini session then query inide docker container directly.
```
./bin/spawn-gemini.sh
```
then you will be inside docker container
```
gemini query -q "select chrom, start, end, ref, alt, (gts).(*) from variants" /dbs/joint.db
```
### Querying 
we can skip all installation/preprocessing section in [Gemini Doc](https://gemini.readthedocs.io/en/latest/#table-of-contents)
- [Querying the GEMINI database](https://gemini.readthedocs.io/en/latest/content/querying.html)
- Querying the gene tables 
- Built-in analysis tools
