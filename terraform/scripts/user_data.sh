#!/bin/bash
    
echo "Update with latest packages"
yum update -y
    
echo "Install Apache"
yum install -y httpd git
    
echo "Enable Apache service to start after reboot"
sudo systemctl enable httpd
    
echo "Install application"
cd /tmp
git clone https://github.com/ian-soares/app-static-site-ec2
cat <<EOF > /var/www/html/index.html
<html>
    <head>
        <title>EC2 Site</title>
        <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    </head>
    <body>
        <h1>Teste sitezinho</h1>
    </body>
</html>
EOF

cat <<EOF > /var/www/html/error.html
<html>
    <head>
        <title>Site error</title>
        <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    </head>
    <body>
        <p>Ops. Erro !!!</p>
    </body>
</html>
EOF

echo "Start Apache service"
service httpd restart