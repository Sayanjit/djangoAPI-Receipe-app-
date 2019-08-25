                                        ######This is the main dockerfile which builds the docker image for the application######


# Cloning a prebuild-image from docker hub for python 3.6 over which I am customizing my own requirements
FROM python:3.6-alpine

# Maintainer is nothing but who is maitaining the project just a name of developer or company etc..
MAINTAINER SAYANJIT DAS

# This below code is to tell docker image to run python print statements directly without using any buffer,basically to avoid buffering in any situation of code
ENV PYTHONUNBUFFERED 1

# Copying the local requirements.txt to docker image's requirements.txt
COPY requirements.txt /requirements.txt

# Installing requirements to docker image
RUN pip install -r /requirements.txt

# Making our application directory where our sources code will exist
RUN mkdir /app

# Mentioning the working directory that is the directory where main application exist to docker image
WORKDIR /app

# Copying application directory to docker image
COPY ./app /app

# Creating a seperate user to run this docker image
RUN adduser -D receipeapp

# Switching to the above mentioned user
USER receipeapp