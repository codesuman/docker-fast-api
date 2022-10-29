# Start from the official Python base image.
FROM python:3.9

# Set the virtual working directory to /code. 
# This is where we'll put the requirements.txt file and the app directory in subsequent steps.
WORKDIR /code

# Copy the file with the requirements to the /code directory.
# Copy only the file with the requirements first, not the rest of the code.
# As this file doesn't change often, Docker will detect it and use the cache for this step, enabling the cache for the next step too.
COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy the all files to /code directory.
# As this has all the code which is what changes most frequently the Docker cache won't be used for this or any following steps easily.
# So, it's important to put this near the end of the Dockerfile, to optimize the container image build times.
COPY . .

# Set the command to run the uvicorn server.
# CMD takes a list of strings, each of these strings is what you would type in the command line separated by spaces.
# This command will be run from the current working directory, the same /code directory you set above with WORKDIR /code.
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]