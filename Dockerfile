# Use an official Python runtime as a parent image.
# We are using a slim version to keep the image size small.
FROM python:3.9-slim

# Set the working directory inside the container.
WORKDIR /app

# Copy the requirements file into the container at /app.
COPY requirements.txt .

# Install any necessary Python packages from requirements.txt.
# The --no-cache-dir option is used to prevent pip from caching
# downloaded packages, which helps to reduce the image size.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container.
# This includes app.py and the templates directory.
COPY . .

# Expose port 5000 so the app can be accessed from outside the container.
EXPOSE 5000

# Define environment variables needed for Flask to run the app.
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# The command to run the Flask application when the container starts.
CMD ["flask", "run"]
