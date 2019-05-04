FROM python:3.6-slim

COPY requirements.txt /tmp/

RUN apt-get update ; \
    apt-get install -y graphviz ; apt-get install python3-dev ;

RUN pip3 install --upgrade setuptools

RUN pip3 install Cython

RUN pip3 install -r /tmp/requirements.txt

RUN pip3 install scikit-surprise

RUN useradd -ms /bin/bash jupyter

USER jupyter
WORKDIR /home/jupyter

EXPOSE 8888:8888

CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
