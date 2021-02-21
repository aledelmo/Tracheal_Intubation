FROM tensorflow/tensorflow:latest-gpu-jupyter
LABEL maintainer="Alessandro Delmonte <delmonte.ale92@gmail.com>"

COPY requirements.txt /tf

WORKDIR /tf

RUN pip install -U -r requirements.txt

EXPOSE 8888
EXPOSE 6006

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --debug --notebook-dir=/tf --ip 0.0.0.0 --allow-root"]