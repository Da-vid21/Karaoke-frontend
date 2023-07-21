FROM python:3.9
# copy the requirements file into the image
COPY ./requirments.txt /app/requirments.txt

# switch working directory
WORKDIR /app

# install the dependencies and packages in the requirements file
RUN pip install -r requirments.txt

# copy every content from the local file to the image
COPY . /app

EXPOSE 80

CMD ["python3", "app.py"]