package TestRunner;

import org.junit.runner.RunWith;

import io.cucumber.junit.CucumberOptions;
import io.cucumber.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(features = "src/test/resources", glue = {
    "com.appiancorp.ps.cucumber"}, plugin = {"pretty"}, tags = "@Tempo and not @Application")
public class RunCucumberForAppianTest {
}
