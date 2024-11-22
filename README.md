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

# install selenium library
pip install --upgrade robotframework-seleniumlibrary

# instad of selenium library, you can use Browser Library based on playwright
pip install --upgrade robotframework-browser
rfbrowser init
```

if using selenium library, download chromedriver and put it in a location that is in the PATH environment
