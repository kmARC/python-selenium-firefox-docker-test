Python + Selenium example using firefox in an Alpine Docker image
==================================================================

A docker image (333MB) that runs a selenium test in a headless firefox instance.

## Build a docker image
```bash
docker build -t $USER/selenium:latest .
```

## Run the example
```bash
docker run $USER/selenium
```

## To fiddle with `test.py`

```bash
# Create a new virtualenv
python3 -m venv .venv

# Use the newly created virtualenv
source .venv/bin/activate
# OR use direnv
direnv allow

# Install requirements
pip3 install -r requirements.txt
pip3 install -r requirements-dev.txt
```
