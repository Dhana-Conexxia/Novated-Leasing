package utils;

import org.junit.AfterClass;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ReportArchiver {

    public static void archiveReport() {
        String timestamp = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss").format(new Date());
        File latestReport = new File("reports/ExtentReport/latest/cucumber-report.html");
        File archiveFolder = new File("reports/ExtentReport/archive");
        if (!archiveFolder.exists()) archiveFolder.mkdirs();

        if (latestReport.exists()) {
            File destination = new File(archiveFolder, "cucumber-report-" + timestamp + ".html");
            try {
                Files.copy(latestReport.toPath(), destination.toPath(), StandardCopyOption.REPLACE_EXISTING);
                System.out.println("✅ Report archived as: " + destination.getAbsolutePath());
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("⚠️ No report found to archive.");
        }
    }
}
