# Use the official Python image from the Docker hub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt /app/

# Install the dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files into the container
COPY . /app/

# Expose the port your Flask app runs on (default Flask port is 5000)
EXPOSE 5000

# Set the environment variable to indicate Flask's run mode (development/production)
ENV FLASK_APP=main.py
ENV FLASK_ENV=development

# Command to run the Flask app using Gunicorn (production-ready server)
CMD ["gunicorn", "--bind", "127.0.0.1:5000", "main:app"]
