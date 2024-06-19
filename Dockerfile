# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster
 
# Set the working directory in the container to /app
WORKDIR /app
 
# Add the artifact URL as an environment variable
ENV ARTIFACT_URL /app.zip
# Install unzip
RUN apt-get update && apt-get install -y unzip
 
# Download and unzip the artifact
ADD $ARTIFACT_URL /app/
RUN unzip /app/app.zip && rm /app/app.zip
 
# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
 
# Make port 80 available to the world outside this container
EXPOSE 5000
 
# Run app.py when the container launches
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]


# # Use an official Python runtime as a parent image
# FROM python:3.7-slim

# # Set the working directory in the container to /app
# WORKDIR /app

# # Add the current directory contents into the container at /app
# ADD . /app

# # Install any needed packages specified in requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

# # Make port 80 available to the world outside this container
# EXPOSE 5000

# # Run app.py when the container launches
# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
