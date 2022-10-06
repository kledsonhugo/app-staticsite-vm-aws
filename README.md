# Lab de uso do AWS EC2

O objetivo desta atividade é explorar na prática os conceitos de comptação em nuvem utilizando o serviço **AWS Elastic Compute Cloud (EC2)**.

> Referência: [https://aws.amazon.com/pt/ec2/](https://aws.amazon.com/pt/ec2/)

O Amazon EC2 pode ser utilizado para hospedar quaisquer aplicações, tais como aplicações web, aplicações MiddleWare, aplicações de banco de dados, jogos, aplicações empresariais, entre outras.

> Referência: [https://aws.amazon.com/pt/getting-started/guides/deploy-webapp-ec2/](https://aws.amazon.com/pt/getting-started/guides/deploy-webapp-ec2/)

<br/><br/>
## Passo-a-passo

01. Faça login no AWS Console.

02. Em **Serviços** selecione **VPC**.

03. Selecione o botão **Criar VPC**.

04. Na tela de criação de VPC preencha com as informações abaixo e no final da tela clique em  **Criar VPC**.

    - **VPC e muito mais**
    - **Gerar automaticamente**: desabilitado
    - **Bloco CIDR IPv4**: 20.0.0.0/16
    - **Número de zonas de disponibilidade (AZs)**: 1
    - **Número de sub-redes públicas**: 1
    - **Número de sub-redes privadas**: 0
    - **Endpoints da VPC**: Nenhuma<br/><br/>

    > **ATENÇÃO !!!** Mantenha as demais opções padrões. 

05. Em **Serviços** selecione **EC2**.

06. Selecione o botão **Executar instância**.

07. No campo **Nome** preencha com **ec2-InstanceName** substituindo **InstanceName** pelo seu primeiro nome. Exemplo: **ec2-kledson**

08. Na seção **Par de chaves (login)** selecione a chave **vockey** ou crie uma chave de segurança de preferência.

09. Na seção **Configurações de Rede** clique em **Editar** e preencha com as informações abaixo.

    - **VPC**: Selecione a vpc com endereçamento 20.0.0.0/16
    - **Atribuir IP público automaticamente**: Habilitar
    - **Firewall (grupos de segurança)**: Criar grupo de segurança<br/><br/>

    > **ATENÇÃO !!!** Mantenha as demais opções padrões. 

10. Clicar em **Adicionar regra de grupo de segurança** e preencha com as informações abaixo.

    - **Tipo**: HTTP
    - **Tipo de origem**: Qualquer lugar<br/><br/>

    > **ATENÇÃO !!!** Mantenha as demais opções padrões. 

11. Na seção **Detalhes avançados** adicione o texto abaixo no campo **Dados do usuário**.

    > **INFO !!!** Esse passo instala e configura automaticamente o WebServer Apache na instância EC2 e carrega a página web estática html disponível no repositório GitHub [https://github.com/kledsonhugo/app-static-site-ec2/tree/main/app](https://github.com/kledsonhugo/app-static-site-ec2/tree/main/app).

    > **ATENÇÃO !!!** Mantenha as demais opções padrões.

    ```
    #!/bin/bash
    
    # Update with latest packages
    yum update -y
    
    # Install Apache
    yum install -y httpd git
    
    # Enable Apache service to start after reboot
    sudo systemctl enable httpd
    
    # Install application
    cd /tmp
    git clone https://github.com/kledsonhugo/app-static-site-ec2
    cp /tmp/static-site/app/*.html /var/www/html/
    
    # Start Apache service
    service httpd restart
    ```

12. Clique em **Executar instância**.

13. Clique em **Visualizar instâncias**.

14. Verifique sua nova instância na lista e aguarde até que o campo **Verificação de status** esteja com o texto **2/2 verificações aprovadas**, conforme ilustração abaixo de exemplo.

    > **ATENÇÃO !!!** A cada 1 minuto você pode atualizar a página para acompanhar a evolução da **Verificação de status**.

    ![AWS EC2 list](/images/2022-09-26-EC2_list.png)

15. Selecione a instância na lista e copie em um bloco de anotações o valor do campo **Endereço IPv4 público**.

16. Abra uma nova aba do seu navegador e acesse a página **http://Endereço IP** ajustando a url com o valor do endereço IP copiado do passo anterior.

    > **INFO !!!** Usando o exemplo da imagem do passo 14, a url da página web é **http://107.21.38.30**. Ajuste a url conforme o endereço IP da sua instância EC2.

17. Para o sucesso desse lab, você deverá visualizar uma página conforme o exemplo abaixo. PARABÉNS !!!

    > **ATENÇÃO !!!** Caso a págna não carregue após 5 minutos, repita os passos anteriores ou contate o instutor.

    > **RECOMENDAÇÃO !!!** Caso esteja utilizando um ambiente pago, não esqueça de destruir os recursos criados para evitar custos indesejados.
 
    ![AWS EC2 static site](/images/2022-09-26-EC2_static_site.png)
