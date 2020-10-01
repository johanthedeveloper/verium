FROM ubuntu:18.04 AS base

# Install needed software
RUN apt update -y && apt upgrade -y
RUN apt-get install -y nano git unzip zip wget 
RUN apt-get install -y build-essential libboost-all-dev libssl1.0-dev libdb++-dev 
RUN apt-get install -y libminiupnpc-dev libcurl4-gnutls-dev libminizip-dev
RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libcurl4-openssl-dev zlib1g-dev libminizip-dev

# Copy scripts files
WORKDIR /usr/libexec/
COPY ./scripts/ ./verium/
RUN find ./verium/ -type f -iname "*.sh" -exec chmod +x {} \;

##############################################
### Starting new container for building
FROM base AS build

# Git Clone
RUN git clone -v https://github.com/VeriumReserve/verium.git /root/git/verium/

#Set new work directory for building verium
WORKDIR /root/git/verium/

# Build verium
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
RUN mkdir -p /app/publish
RUN cp src/veriumd /app/publish
RUN cp src/verium-cli /app/publish
RUN cp src/verium-tx /app/publish
RUN cp src/verium-wallet /app/publish

##############################################
### Starting new container for publish
FROM base AS publish

#copy from build
COPY --from=build /app/publish /usr/bin/

# Add entrypoint
ENTRYPOINT ["/usr/libexec/verium/startup.sh"]
