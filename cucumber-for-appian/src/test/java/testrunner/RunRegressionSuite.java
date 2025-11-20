package testrunner;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import utils.ReportArchiver;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {
                "src/test/resources/features/Regression"
        },
        glue = {"com.appiancorp.ps.cucumber.fixtures"},
        plugin = {
        "pretty",
        "html:reports/ExtentReport/latest/cucumber-report.html",
        "json:reports/ExtentReport/latest/cucumber-report.json",
        "com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter:"
        },
        tags = "@Regression",
        monochrome = true
)
public class RunRegressionSuite {
    @BeforeClass
    public static void beforeTests() {
        System.out.println(">>> Starting Cucumber Tests...");
    }

    @AfterClass
    public static void afterTests() {
        // Archive Extent or Cucumber reports after execution
        ReportArchiver.archiveReport();
    }
}





