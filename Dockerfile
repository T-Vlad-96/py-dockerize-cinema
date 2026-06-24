FROM python:3.12-alpine
LABEL maintainer="T_Vlad96"
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
RUN mkdir -p $MEDIA_DATA
RUN adduser \
    -- disabled-password \
    -- no-create-home \
    new_user
RUN chown -R $MEDIA_DATA new_user
RUN chmod -R 755 $MEDIA_DATA

USER new_user
