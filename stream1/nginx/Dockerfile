ARG NGINX_VERSION=1.20.1
ARG NGINX_RTMP_VERSION=1.2.1

#---------
# NGINX
#---------
FROM centos:7
ARG NGINX_VERSION
ARG NGINX_RTMP_VERSION

# NGINX dependencies
RUN yum install \
  ca-certificates \
  curl \
  gcc epel-release \
  libc-devel \
  glibgcc \
  make \
  openssl \
  openssl-devel \
  pcre \
  pcre-devel \
  pkgconf \
  pkgconfig \
  wget net-tools \
  zlib-devel -y

# nginx source
RUN cd /tmp && \
  wget https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && \
  tar zxf nginx-${NGINX_VERSION}.tar.gz && \
  rm nginx-${NGINX_VERSION}.tar.gz

# nginx-rtmp module
RUN cd /tmp && \
  wget https://github.com/arut/nginx-rtmp-module/archive/v${NGINX_RTMP_VERSION}.tar.gz && \
  tar zxf v${NGINX_RTMP_VERSION}.tar.gz && rm v${NGINX_RTMP_VERSION}.tar.gz

# Compile nginx
RUN cd /tmp/nginx-${NGINX_VERSION} && \
  ./configure \
  --prefix=/opt/nginx \
  --add-module=/tmp/nginx-rtmp-module-${NGINX_RTMP_VERSION} \
  --conf-path=/opt/nginx/conf/nginx.conf \
  --with-threads \
  --with-file-aio \
  --with-http_ssl_module \
  --with-debug && \
  cd /tmp/nginx-${NGINX_VERSION} && make && make install

# Cleanup.
RUN rm -rf /var/cache/* /tmp/*
