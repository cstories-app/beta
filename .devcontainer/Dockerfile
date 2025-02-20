FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    # curl
    libcurl4-openssl-dev \
    # textshaping
    libharfbuzz-dev libfribidi-dev \
    # terra -> leaflet
    gdal-bin libgdal-dev proj-bin \
    # systemfonts dependencies
    libfontconfig1-dev libfreetype6-dev