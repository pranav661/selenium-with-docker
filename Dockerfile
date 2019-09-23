FROM openjdk:8-jre-slim

# Add the project jar & copy dependencies
ADD  target/container-test.jar /usr/share/tag/container-test.jar
ADD  target/libs /usr/share/tag/libs

# Add the suite xmls
ADD order-module.xml /usr/share/tag/order-module.xml
ADD search-module.xml /usr/share/tag/search-module.xml

# ENV
# Command line to execute the test
# Expects below ennvironment variables
# BROWSER = chrome / firefox
# MODULE  = order-module / search-module
# $SELENIUM_HUB = $INTERNET_IP(Generated on GKE Selenium hub model)
# ENTRYPOINT /usr/bin/java -cp /usr/share/tag/container-test.jar:/usr/share/tag/libs/* -DseleniumHubHost=$SELENIUM_HUB -Dbrowser=$BROWSER org.testng.TestNG /usr/share/tag/$MODULE
ENTRYPOINT /usr/bin/java -cp /usr/share/tag/container-test.jar:/usr/share/tag/libs/* -DseleniumHubHost=35.201.133.173 -Dbrowser=chrome org.testng.TestNG /usr/share/tag/order-module
