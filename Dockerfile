FROM python:3.8-slim as builder
# copy the requirements file into the image
COPY ./requirments.txt /app/requirments.txt

# switch working directory
WORKDIR /app

# install the dependencies and packages in the requirements file
RUN pip install -r requirments.txt

# copy every content from the local file to the image
COPY . /app

EXPOSE 8000

CMD ["gunicorn", "app:app"]