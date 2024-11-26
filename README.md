# Robot Framework PoC

## Env Requirement

Python 3
pip

## Robot Framework installation

```shell
# install robotframework
pip install robotframework

# check if it was installed
robot --version

# install Browser Library based on playwright
pip install --upgrade robotframework-browser
rfbrowser init
```

## executing test

```shell
robot --xunit xunit.xml --outputdir ./results ./tests
```
