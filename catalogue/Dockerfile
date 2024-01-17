FROM python:3.12-slim
RUN useradd -m nonroot
USER nonroot
WORKDIR /home/nonroot/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["/home/nonroot/.local/bin/gunicorn", "-b", "0.0.0.0:5000", "app:app"]

