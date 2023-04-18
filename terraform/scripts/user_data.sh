#!/bin/bash
    
echo "Update with latest packages"
yum update -y
    
echo "Install Apache"
yum install -y httpd git
    
echo "Enable Apache service to start after reboot"
sudo systemctl enable httpd
    
echo "Install application"
cd /tmp
git clone https://github.com/lurickardo/app-static-site-ec2
cp /tmp/app-static-site-ec2/app/*.html /var/www/html/
cat <<EOF > /var/www/html/index.html
<html>
    <head>
        <title>Site Luiz Ricardo | RM 98150</title>
    </head>
    <body>
        <p>Kledsoooooooooooooooooooon</p>
        <p>Gostaria de mostrar para você Davi Jones, o inocente mais culpado do mundo:</p>
        <img src="https://tm.ibxk.com.br/2022/09/16/16183746604197.jpg" alt="Dava jonas">
    </body>
</html>
EOF
    
echo "Start Apache service"
service httpd restart