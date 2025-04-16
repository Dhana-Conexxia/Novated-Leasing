# Contributing to Appian Selenium API

## Building the Project

Appian Selenium API requires a minimum of Java 11 and can be built with `./gradlew build`

While Java 11 is the minimum version supported, we aim to retain compatability with newer Java versions as well. 
An automated check will run for all MRs to ensure any changes compile with future Java versions.

## Running the Tests

The easiest way to run tests is using the docker files within this project.
1. Navigate to the `docker` directory
2. Add an `.env` with the following keys
   * GITLAB_TOKEN - Token that has read access to this projects package registry
   * USERNAME - User that will be used to log in for tests
   * PASSWORD - Password for that user
   * (optional) SCREENSHOT_DIR - Path on your local machine that should be mapped to the screenshot directory
   * (optional) DOWNLOADS_DIR - Path on your local machine that should be mapped to the downloads directory
   * (optional) FITNESSEROOT_DIR - Path on your local machine that should be mapped to a Fitnesse root directory
   * (optional) CUCUMBERTEST_DIR - Path on your local machine that should be mapped to a directory with cucumber tests
3. Bring up the docker containers using `docker-compose up`
4. If you get errors about being unable to create directories, ensure the default directories (screenshots, downloads, FitNesseRoot, cucumber) exist before continuing

All tests executed using this method should use the `REMOTE_CHROME` browser. Execution of tests can be viewed at `localhost:4444`.

### Fitnesse

1. Navigate to `localhost:8980`
2. Execute test

### Cucumber

1. Run `docker exec docker-fitnesse-1 run_cucumber.sh`

### Selenium

1. Set `url` environment variable to the URL of the site you are testing against
2. Set `version` environment variable to the version of Appian running on the site
3. In terminal, run `./gradlew setup`
4. Navigate to [`appian-selenium-api/src/test/java/com/appiancorp/ps/automatedtest/test/AbstractTest.java`](./appian-selenium-api/src/test/java/com/appiancorp/ps/automatedtest/test/AbstractTest.java):
    1. Configure the users.
       1. To use existing users on your site, update the usernames and passwords (i.e. `TEST_USERNAME`, `ADMIN_USERNAME`, ...) to users available on your testing site.
       2. Then put the updated values in [`shared-properties/configs/users.properties`](./shared-properties/configs/users.properties). Alternatively, create the users fitnesse.user and fitnesse.admin on your site, with the passwords specified in the config file.
4. If you want to test on a **Automated Testing - xx.x.zip** app in `/apps`, install the testing app using the following steps:
    1. Import the corresponding **Automated Testing - xx.x.zip** from the `/apps` folder of this repo to a site.
    2. Open the Data Store **AUT_DS**, click **VERIFY** and **SAVE & PUBLISH**.
    3. Navigate to `/suite/tempo/actions`, run action **Initialize**.
5. Now you can run the tests in [`appian-selenium-api/src/test`](./appian-selenium-api/src/test) directory.  For example, you can use the IntelliJ IDEA IDE to run the tests directly.

## Submitting Merge Requests

Before submitting an MR:

* Your patch should include new tests that cover your changes, or be accompanied by explanation for why it doesn't need any. It is you and your reviewer's responsibility to ensure your patch includes adequate tests.
* Your code should pass all the automated tests before you submit your PR for review.
  * See [Running the tests](#running-the-tests) above.
  * You can label pull requests as "Draft" to indicate they are not yet ready for merge.
* Your patch should include a changelog entry in the "unreleased" section of CHANGES.md, particularly if it would be a breaking change for consumers of the tool.

When submitting an MR:

* You agree to license your code under the project's open source license (APACHE 2.0).
* Base your branch off the current `main` branch.
* Add both your code and new tests if relevant.
