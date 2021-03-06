# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/minimal-notebook

LABEL maintainer="ecleya <ecleya@gmail.com>"


# Install Algospot Kernel
RUN conda update -y conda && \
    conda create -y --name algospot.python python=3.4.3 ipykernel && \
    /bin/bash -c "source activate algospot.python" && \
    pip install requests termcolor beautifulsoup4 && \
    python -m ipykernel install --user --name "algospot.python" && \
    /bin/bash -c "source deactivate"

# Install Keras Kernel
RUN conda create -y --name keras python=3.6.7 ipykernel && \
    /bin/bash -c "source activate keras" && \
    pip install keras tensorflow && \
    python -m ipykernel install --user --name "keras" && \
    /bin/bash -c "source deactivate"

# Install Cling Kernel
RUN conda create -y --name algospot.cpp cling && \
    /bin/bash -c "source activate algospot.cpp" && \
    conda install -y xeus-cling -c QuantStack -c conda-forge && \
    /bin/bash -c "source deactivate"
