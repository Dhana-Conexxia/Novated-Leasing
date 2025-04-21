# Appian Selenium API

There are three main modules:

1. **appian-selenium-api:** Base fixture methods to interact with Appian UI components, this is the foundation of
   other testing tools in this repository. User can also choose to extend this API in their own application.
1. **fitnesse-for-appian:** Testing tool integrated with [FitNesse](http://docs.fitnesse.org/) framework.
1. **cucumber-for-appian:** Testing tool integrated with [Cucumber](https://cucumber.io/) framework.

Appian Selenium API provides an easy way to create UI-driven automated tests for Appian applications, which
can be used for functional and regression testing of user interfaces and process model logic.

## Contributing

If you want to help develop this tool you can:

* View the [contributor guidlines](contributing.md)
* File or work [issues](https://gitlab.com/appian-oss/appian-selenium-api/-/issues) on GitLab

## Support Policy

Please understand that:

* We do not guarantee response times
* Pull requests may take several weeks to review
* Not all issues will be addressed
    * Bug reports are the only issues that will be given priority

## Release Process

Automated tests will run nightly and upon a passing run, if there were any changes, a package will be released.

The latest packages can be found in
the [GitLab Package Registry](https://gitlab.com/appian-oss/appian-selenium-api/-/packages)

If you prefer a all-in-one Docker image, that can be found in
the [Container Registry](https://gitlab.com/appian-oss/appian-selenium-api/container_registry)

