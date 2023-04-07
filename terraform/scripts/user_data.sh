#!/bin/bash
    
echo "Update with latest packages"
yum update -y
    
echo "Install Apache"
yum install -y httpd git
    
echo "Enable Apache service to start after reboot"
sudo systemctl enable httpd
    
echo "Install application"
cd /tmp
git clone https://github.com/kledsonhugo/app-static-site-ec2
cat <<EOF > /var/www/html/index.html
<html>
    <head>
        <title>EC2 Site</title>
        <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    </head>
    <body>
        <p>Olá.</p>
        <p>Bem vindo!!!!!!!!</p>
        <p></p>
        <p>Aqui você irá:</p>
        <ul>
        <li>aprender</li>
        <li>colaborar</li>
        <li>compartilhar</li>
        </ul>
        <p></p>
        <p><b>Ian Soares</b><br /><a href="https://www.linkedin.com/in/ian-soaresss/">Meu LinkedIn</a></p>
        <p></p>
    </body>
</html>
EOF

cat <<EOF > /var/www/html/error.html
<html>
    <head>
        <title>S3 Site error</title>
        <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    </head>
    <body>
        <p>Ops. Erro !!!</p>
        <p><b>Ian Soares</b><br /><a href="https://www.linkedin.com/in/ian-soaresss/">https://www.linkedin.com/in/ian-soaresss/</a></p>
        <p></p>
    </body>
</html>
EOF

echo "Start Apache service"
service httpd restart