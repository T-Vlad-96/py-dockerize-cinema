FROM python:3.14.4-alpine3.22
LABEL maintainer="T_Vlad96"
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
RUN mkdir -p "/media_files/uploads/images/"
RUN adduser \
    --disabled-password \
    --no-create-home \
    new_user

RUN chown -R new_user /media_files/uploads/images
RUN chmod -R 755 /media_files/uploads/images

USER new_user
