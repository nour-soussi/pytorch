# Use Miniconda as a base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

COPY . /app
RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

RUN mkdir -p /home/app/plots


# Run the application with conda run to ensure the environment is active
CMD ["python3", "main.py", "--mode", "test", "--data_path", "./data/test",  "--model_path", "./models/cnn_resnet18_freeze_backbone_False.pth"]
