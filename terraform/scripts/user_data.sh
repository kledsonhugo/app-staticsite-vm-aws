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
cp /tmp/app-static-site-ec2/app/*.html /var/www/html/
cat <<EOF > /var/www/html/index.html
<html>
    <head>
        <title>S3 Site</title>
        <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    </head>
    <body>
        <p>E aí, Titio!</p>
        <p></p>
        <p>Aqui eu estou:</p>
        <ul>
        <li>aprendendo (tentando)</li>
        <li>colaborando</li>
        <li>compartilhando</li>
        </ul>
        <p></p>
        <p>Confia, vai dar cero!</p>
        <p></p>
        <img src="data:image/jpeg;base64,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" alt="">
        <p><b>Thomas Sewing Fernandes</b><br /><a href="https://www.linkedin.com/in/thomas-sewing-fernandes/">https://www.linkedin.com/in/thomas-sewing-fernandes/</a></p>
        <p></p>
    </body>
</html>
EOF
echo "Start Apache service"
service httpd restart