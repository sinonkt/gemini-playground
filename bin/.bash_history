bgzip --help
ls
cd /vcfs/
ls
bgzip joint.vcf 
ls
bgzip -d joint.vcf 
bgzip -d joint.vcf.gz 
ls
bgzip --help
bgzip joint.vcf -c test.vcf.gz 
ls
bgzip -d test.vcf.gz -c > test.vcf
ls
bgzip joint.vcf -c test.vcf.gz 
ls
bgzip joint.vcf -c test.vcf.gz 
ls
bgzip joint.vcf -c > test.vcf.gz 
ls
rm -f test.vcf
bgzip -d test.vcf.gz -c > test.vcf
bgzip -d test.vcf.gz -c
vt --help
bgzip --help
