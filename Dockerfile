FROM ubuntu:22.04

# Update apt and install wget
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Change workdir cause it is not possible to remove conda from /root
WORKDIR /dependencies

# Download miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -e PREFIX "/dependencies/root" \
    && rm -f Miniconda3-latest-Linux-x86_64.sh

# Export conda bin to PATH (conda.sh parse "/dependencies/root" as "/dependencies/endencies/root" he-he)
ENV PATH="/dependencies/endencies/root/bin:${PATH}"
ARG PATH="/dependencies/endencies/root/bin:${PATH}"

# Update conda
RUN conda update -n base -c defaults conda

# Install conda environment
COPY environment.yml ./
RUN conda env create -f environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH="/dependencies/endencies/root/envs/bioinf/bin:$PATH"

# Remove conda and its cache from container
RUN conda install anaconda-clean
RUN anaconda-clean --yes
RUN rm -rf /root/.cache/ /root/.conda /root/.anaconda_backup
