# AWS Nginx/PHP-FPM Build

## Overview
It is very usefull to start only one .sh file on the very empty aws instance. It saves lots of time.

## What does it actually do?

1. Update all packages
2. Install Nginx and delete default config files
3. Install PHP-FPM 
4. Install Composer in /usr/bin for use across server
5. Unzip and overwrite files in Nginx, PHP-FPM
8. Remove zip file and change ownership of directories to nginx
9. Update all packages
10. Clear any current logs