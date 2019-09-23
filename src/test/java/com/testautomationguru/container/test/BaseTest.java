package test.java.com.testautomationguru.container.test;

import org.testng.annotations.BeforeTest;

import java.net.MalformedURLException;
import java.net.URL;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.testng.annotations.AfterTest;

public class BaseTest {

    protected WebDriver driver;

    @BeforeTest
    public void setUp() throws MalformedURLException {

        DesiredCapabilities dc = DesiredCapabilities.chrome();

        if (System.getProperty("browser").equals("firefox"))
            dc = DesiredCapabilities.firefox();

        //String host = System.getProperty("104.196.144.175");
        //  String host = "104.196.144.175";
        String host = "34.80.100.196";
        driver = new RemoteWebDriver(new URL("http://" + host + ":4444/wd/hub"), dc);

    }

    @AfterTest
    public void tearDown() throws InterruptedException {
        driver.quit();
    }
}
