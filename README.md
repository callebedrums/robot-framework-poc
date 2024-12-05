# Robot Framework PoC

## Env Requirement

Python 3
pip
nodejs

## Robot Framework installation

```shell
# install robotframework
pip install robotframework

# check if it was installed
robot --version


# install Selenium Library
# install chromedriver
pip install --upgrade robotframework-seleniumlibrary
npm install chromedriver


# install Browser Library based on playwright
pip install --upgrade robotframework-browser
rfbrowser init
```

## executing test

```shell
## running just browser-library
robot --xunit xunit.xml --outputdir ./results/browser-library ./tests/browser-library

## running just selenium-library
robot --xunit xunit.xml --outputdir ./results/selenium-library ./tests/selenium-library
```

The Chromium browser has the capacity to simulate different network speeds.
We provided some configurations available in the test/custom/poc.js file.
Use the TEST_SPEED environment variable to set the speed you want to execute the test.
If no environment variable is configured, the Default speed is used, which is the default chromium browser speed without any simulation.

```shell
TEST_SPEED='Speed 1' robot --xunit xunit.xml --outputdir ./results ./tests
```

### References

- [Chromium throttle](https://github.com/microsoft/playwright/issues/6038#issuecomment-812521882)
- [Selenium Chrome driver](https://www.selenium.dev/selenium/docs/api/py/_modules/selenium/webdriver/chromium/webdriver.html)
- [Extending Selenium Library with python](https://github.com/robotframework/SeleniumLibrary/blob/master/docs/extending/extending.rst)
- [Extending Browser Library with JavaScript](https://marketsquare.github.io/robotframework-browser/Browser.html#Extending%20Browser%20library%20with%20a%20JavaScript%20module)
- [Browser Library Key Words](https://marketsquare.github.io/robotframework-browser/Browser.html)
- [Selenium Library Key Words](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- [Robot Framework Variables](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#variables)
- [Robot Framework Environment Variables](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#environment-variables)
- [Robot Framework Test Suite setup](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#suite-setup-and-teardown)

### Azure pieline

```yaml
trigger:
  branches:
    include:
      - "*"
  paths:
    exclude:
      - ./README.md

pool:
  vmImage: ubuntu-latest
  # vmImage: nikolaik/python-nodejs:python3.9-nodejs20

steps:
  - task: NodeTool@0
    inputs:
      versionSpec: "20.x"
    displayName: "Install Node.js"

  - script: pip install --upgrade pip && pip install -r requirements.txt && npm install chromedriver
    displayName: "Install dependencies"

  - script: rfbrowser init
    displayName: "Initialize RF Browser"

  - script: robot --xunit xunit.xml --outputdir ./results/browser-library ./tests/browser-library
    displayName: "Running Robot Tests with Browser Library"

  - script: robot --xunit xunit.xml --outputdir ./results/selenium-library ./tests/selenium-library
    displayName: "Running Robot Tests with Selenium Library"

  # Publish test results as pipeline artifact
  - task: PublishPipelineArtifact@1
    inputs:
      targetPath: "./results"
      artifact: "results"
      publishLocation: "pipeline"
```
