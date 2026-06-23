FROM python:3.12-alpine
MAINTAINER "T-Vlad96"
ENV PYTHONDONTWRITEBYTECODE = 1
ENV PYTHONUNBUFFERED = 1
WORKDIR /app
COPY requirements.txt requirement.txt
RUN pip install -r requirements.txt
COPY . .
