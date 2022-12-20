FROM continuumio/miniconda3:4.12.0
LABEL authors="Natalia Luneva" \
      description="Docker image containing some bioinformatics tools" \
      version="0.1.0"

# Update conda
RUN conda update -n base -c defaults conda

# Install the conda environment
COPY environment.yml /
RUN conda env create -f environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/bioinf/bin:$PATH
