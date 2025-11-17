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
                "src/test/resources",               // includes general features
                "src/test/resources/features"       // includes specific features folder
        },
        glue = {"com.appiancorp.ps.cucumber.fixtures"},
        plugin = {
                "pretty",
                "html:build/reports/cucumber/html",
                "com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter:" // Extent report
        },
        tags = "@Application1", // Optional – remove or adjust if you want to run all
        monochrome = true
)
public class RunCucumberForAppianTest {
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





