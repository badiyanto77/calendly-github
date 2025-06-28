# Use AWS Lambda Python 3.9 base image for x86_64 (not arm64)
# FROM --platform=linux/amd64 public.ecr.aws/lambda/python:3.9
# Base Python image
# FROM public.ecr.aws/lambda/python:3.11
FROM public.ecr.aws/lambda/python:3.12


# Set working directory to /var/task (AWS Lambda default)
WORKDIR /var/task

# # Copy application files into the container
# COPY lambda_function.py .
# COPY requirements.txt . 

# Copy requirements.txt
COPY requirements.txt ${LAMBDA_TASK_ROOT}

# Install dependencies
# RUN pip install --no-cache-dir -r requirements.txt
RUN pip install -r requirements.txt

# Copy function code
COPY lambda_function.py ${LAMBDA_TASK_ROOT}

# Set the entry point and handler correctly
# ENTRYPOINT ["/var/lang/bin/python3.12", "-m", "awslambdaric"]

# ENTRYPOINT ["/lambda-entrypoint.sh"]
# CMD ["lambda_function.lambda_handler"]
CMD ["lambda_function.handler"]

#running 1
