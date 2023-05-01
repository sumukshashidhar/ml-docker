FROM nvcr.io/nvidia/pytorch:23.04-py3

# Install and update Python 3.10
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.10 python3.10-dev python3.10-distutils && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1 && \
    update-alternatives --set python /usr/bin/python3.10 && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    rm get-pip.py && \
    pip install ipykernel && \
    python -m ipykernel install --name python3.10 --display-name "Python 3.10"

# Launch Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]

# Mount current working directory
WORKDIR /workspace
VOLUME /workspace
