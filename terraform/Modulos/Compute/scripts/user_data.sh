#!/bin/bash
    
echo "Update with latest packages"
yum update -y
    
echo "Install Apache"
yum install -y httpd git
    
echo "Enable Apache service to start after reboot"
sudo systemctl enable httpd
    
echo "Install application"
cat <<EOF > /var/www/html/index.html
<html>
    <head>
        <title>S3 Site</title>
        <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    </head>
    <body>
        <p>Olá. Me chamo Caio e não sei nada de HTML</p>
        <p>Mas faz parte</p>
        <p></p>
        <p>Acesse o Insta e me add.</p>
        <p>c.martinsz</p>
        <a href="https://www.instagram.com/"</a>

    </body>
</html>
EOF
    
echo "Start Apache service"
service httpd restart