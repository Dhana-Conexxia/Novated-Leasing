# FitNesse for Appian

FitNesse for Appian is a client side tool, built on top of [FitNesse](http://docs.fitnesse.org/), that makes it easy to create automated tests on the Appian platform. This tool allows you to create test scripts in a easy to read wiki language that will be run by the system to interact with an Appian application as a human user.

FitNesse for Appian provides an Appian-specific wiki language within FitNesse that maps directly to actions that can be performed in Appian, such as:

* Navigating the interface (News, Tasks, Records, Reports, Actions, Sites)
* Starting actions and completing tasks
* Validating content on record views or in news events
* And much more... the complete list is available directly within the tool!

For more information about testing and development best practices when using FitNesse for Appian, please read [BESTPRACTICES.md](BESTPRACTICES.md)

## Running Tests

* Navigate to http://localhost:8980/FitNesseForAppian.Examples.TestExample
* Follow the configuration instructions marked by "Please follow the directions below to execute the test"
* Click Test at the top of the page

### Developing custom tests

To try out the tool further, use one of the `Automated Testing - xx.x.zip` files from the [apps](../apps/) directory and import it into your corresponding version of Appian environment.

Navigate to the FitNesseForAppian Cheatsheet and make use of the supported methods to write your own test suite to run against the sample application! Be sure you are using methods for the environment you are testing. For example, if testing sites, use navigation methods that come from the "Sites Methods" scenario. Using methods from a different environment has the potential to break in future releases.
