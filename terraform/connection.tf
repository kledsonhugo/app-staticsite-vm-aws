resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "ec2_key_pair"
  public_key = file("C:\\Users\\vmart\\.ssh\\id_rsa.pub")
}

resource "null_resource" "front_end_apply" {
  provisioner "remote-exec" {
    inline = [
      "if [ -d /var/www/html ]; then",
      "    rm -rf /tmp/repo-atualizado || echo ''",
      "    git clone https://github.com/Salless/app-static-site-ec2 /tmp/repo-atualizado",
      "    sudo cp -r /tmp/repo-atualizado/app/* /var/www/html/",
      "    sudo systemctl restart httpd",
      "    echo 'Site atualizado!'",
      "else",
      "    echo 'Ainda não rodou o script de user-data'",
      "fi"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = aws_instance.instance.public_ip
    private_key = file("C:\\Users\\vmart\\.ssh\\id_rsa")
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}