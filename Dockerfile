FROM python:3.9-slim
# copy the requirements file into the image
COPY ./app/requirments.txt /app/requirments.txt

# switch working directory
WORKDIR /app

# install the dependencies and packages in the requirements file
RUN pip install -r requirments.txt

# copy every content from the local file to the image
COPY ./app /app

# Install nginx
RUN 
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Copy Nginx config into the container
COPY ./nginx/default /etc/nginx/sites-enabled/

# Expose ports
EXPOSE 80

# Start Nginx and the Flask app
CMD service nginx start && python app.py