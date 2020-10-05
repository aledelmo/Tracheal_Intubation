FROM tensorflow/tensorflow:latest-gpu-jupyter
LABEL maintainer="Alessandro Delmonte <delmonte.ale92@gmail.com>"

#RUN apt-get update & apt-get install -y --no-install-recommends lsof

## tcmalloc for memory leakage
# RUN apt install libtcmalloc-minimal4
# ENV LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libtcmalloc_minimal.so.4"

COPY requirements.txt /tf

#RUN pip uninstall -q -y tensorboard
#RUN pip install -q -U tb-nightly tensorboard_plugin_profile

WORKDIR /tf
RUN pip install -U -r requirements.txt

EXPOSE 8888
EXPOSE 6006

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --debug --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root"]

# docker build --build-arg https_proxy=https://10.143.11.22:3128 -f regression.Dockerfile
# --rm --tag airways-gpu-jupyter .

# docker run -u $(id -u) --gpus all -it --cpus="20" -v /home/imag2/External_Projects/Upper_Airways_Dimensions_DL:/tf
# --env HTTPS_PROXY=https://10.143.11.22:3128 -p 8888:8888 -p 6006:6006 --rm --name tf airways-gpu-jupyter:latest
