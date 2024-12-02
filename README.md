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

The Chromium browser has the capacity to simulate different network speeds.
We provided some configurations available in the test/custom/poc.js file.
Use the TEST_SPEED environment variable to set the speed you want to execute the test.
If no environment variable is configured, the Default speed is used, which is the default chromium browser speed without any simulation.

```shell
TEST_SPEED='Speed 1' robot --xunit xunit.xml --outputdir ./results ./tests
```

### References

- [Chromium throttle](https://github.com/microsoft/playwright/issues/6038#issuecomment-812521882)
- [Extending Browser Library with JavaScript](https://marketsquare.github.io/robotframework-browser/Browser.html#Extending%20Browser%20library%20with%20a%20JavaScript%20module)
- [Robot Framework Variables](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#variables)
- [Robot Framework Environment Variables](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#environment-variables)
- [Robot Framework Test Suite setup](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#suite-setup-and-teardown)
