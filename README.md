## Theory

* What are computer ports on a high level? How many ports are there on a typical computer?
  - Port is an entry point for a network connection. A port number is a 16-bit unsigned integer, thus ranging from 0 to 65535. But for example Macbook has 4 type-C ports ))0)
* What is the difference between http, https, ssh, and other protocols? In what sense are they similar? Name default ports for several data transfer protocols.
  - http is	hypertext transfer protocol used in the www (default ports 80).
  - https is almost the same as http but more secure (default ports 443).
  - ssh is secure shell protocol for operating network services securely over an unsecured network (default ports 22).
* What is Nginx? How does it work on the high level? List several alternative web servers.
  - NGINX is a web server that can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache. It uses an asynchronous, event-driven approach where requests are handled in a single thread. Alternative - Apache web server.

## Problem

**Remote Server**:
* Create a new virtual machine in the Yandex/Mail/etc cloud. Generate SSH key pair and use it to connect to your server. ✅
* Download the latest human genome assembly (GRCh38) from the Ensemble FTP server. Index the fasta using samtools and GFF3 using tabix. ✅
* Select and download BED files for three ChIP-seq and one ATAC-seq experiment from the ENCODE. Sort, bgzip, and index them using tabix. ✅

**JBrowse 2**:
* Download and install JBrowse 2. Create a new jbrowse repository in `/mnt/JBrowse/` (or some other folder). ✅
* Install nginx and update its config(/etc/nginx/nginx.conf). ✅
* Restart the nginx and make sure that you can access the browser using a link like this: `http://158.160.7.30/jbrowse/`. ✅
* Add your files to the genome browser and verify that everything works as intended. ✅
