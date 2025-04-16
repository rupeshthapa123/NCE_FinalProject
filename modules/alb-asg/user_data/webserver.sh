#!/bin/bash
yum update -y
yum install -y httpd aws-cli

sudo systemctl start httpd
sudo systemctl enable httpd

# Create index.html with Terraform template variables
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Final Project ACS730</title>
</head>
<body>
    <h1>Environment: ${environment}</h1>
    <h2>Team: ${group_name}</h2>
    <h2>Team Member: Rupesh, Sandesh, Aakash, Sagar </h2>
    <h3>Instance Type: ${instance_type}</h3>
    <h4>Availability Zone: $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)</h4>
</body>
</html>
EOF

sudo systemctl restart httpd
