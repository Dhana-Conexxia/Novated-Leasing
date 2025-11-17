package utils;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import java.io.File;
import java.util.Collections;
import java.util.List;

public class CucumberReportGenerator {
    public static void generateReport() {
        File reportOutputDir = new File("build/reports/cucumber-advanced-html");
        List<String> jsonFiles = Collections.singletonList("build/reports/cucumber/cucumber.json");

        Configuration config = new Configuration(reportOutputDir, "Cucumber Test Report");
        config.setBuildNumber("1.0.0");
        config.addClassifications("Platform", System.getProperty("os.name"));
        config.addClassifications("Java Version", System.getProperty("java.version"));

        ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, config);
        reportBuilder.generateReports();
    }

    public static void main(String[] args) {
        generateReport();
    }
}
