FROM tensorflow/tensorflow

ENV GOLANG_VERSION 1.7.5
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_SHA256 2e4dd6c44f0693bef4e7b46cc701513d74c3cc44f2419bf519d7868b12931ac3
# Set up golang
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends \
# Install gcc for cgo
        g++ \
        gcc \
        libc6-dev \
        make \
        pkg-config \
# Notebook Dependencies
        libzmq3-dev \
        build-essential \
        python3-pip \
        git && \
    rm -rf /var/lib/apt/lists/* && \
    curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz && \
    echo "$GOLANG_DOWNLOAD_SHA256  golang.tar.gz" | sha256sum -c - && \
    tar -C /usr/local -xzf golang.tar.gz && \
    rm golang.tar.gz && \
    mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH" && \
    curl -fsSL https://git.io/vDyrl -o /usr/local/bin/go-wrapper && \
# Install Gophernotes
    go get golang.org/x/tools/cmd/goimports && \
    go get -tags zmq_3_x github.com/gopherds/gophernotes && \
    mkdir -p ~/.ipython/kernels/gophernotes && \
    cp -r $GOPATH/src/github.com/gopherds/gophernotes/kernel/* ~/.ipython/kernels/gophernotes && \
    mv /notebooks/* /go
COPY get-pip.py /get-pip.py
RUN python3 /get-pip.py && \
    pip install --upgrade pip && \
    python3 -m pip install ipykernel && \
    python3 -m ipykernel install --user

# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

WORKDIR "/go"

CMD ["/run_jupyter.sh"]
