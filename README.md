# PHP-7.4-XMLRPC-Custom-Startup-Script

This is a example of how to install the XMLRPC PHP extension in a custom Startup Script on Azure. This is the recommended way of installing extra depenencies if using "Blessed"/Builtin App Service Docker images.

To have the application start using this startup script, do the following:
  - Use an FTP client to copy the `startup.sh` file to `/home` (not `/home/site/wwwroot`).
  - Go to the Azure Portal for the Web App -> Configuration -> General Settings -> in Startup Command put `/home/startup.sh`.
  - Click Save. Optionally restart the application.
  - Now when reviewing Application Logs you should see stdout for XMLRPC and related dependencies be downloaded. You can validate this go going to Kudu -> SSH -> running `php -m | grep "xml"` and should now see `xmlrpc` under the listed modules.

> **NOTE**: In the startup script, you don't have to specify the actual startup command for the PHP7.x Docker Containers as the command `apache2 -D FOREGROUND` is ran as a second argument regardless.

Additionally this blog can be reviewed for the same above steps: https://azureossd.github.io/2020/01/23/php-custom-startup-script-app-service-linux/
