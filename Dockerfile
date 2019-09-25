FROM biohaz/basic_ubuntu:latest

# Locale for click
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8


# Install conda
RUN wget -q https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda3.sh
RUN /bin/bash /tmp/miniconda3.sh -bp /opt/miniconda3
RUN rm /tmp/miniconda3.sh

# Update conda and install conda-build
RUN /opt/miniconda3/bin/conda update -yq conda
RUN /opt/miniconda3/bin/conda install -yq conda-build

# Set conda environment
RUN echo "export PATH=/opt/miniconda3/bin:$PATH" > /etc/profile
ENV PATH /opt/miniconda3/bin:$PATH

RUN wget https://data.qiime2.org/distro/core/qiime2-2019.7-py36-linux-conda.yml \
	&& conda env create -n qiime2 --file qiime2-2019.7-py36-linux-conda.yml \
	&& rm qiime2-2019.7-py36-linux-conda.yml
