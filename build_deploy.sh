/opt/maven/bin/mvn clean package
mv target/my-app-1.0-SNAPSHOT.jar  target/myownname-$BUILD_NUMBER.jar 
aws s3 cp target/myownname-$BUILD_NUMBER.jar  s3://artifacts-devops-learn/

aws s3 cp s3://artifacts-devops-learn/myownname-$build.jar .
aws s3 cp s3://artifacts-devops-learn/pipelines.pem .
chmod 400 pipelines.pem
scp -i pipelines.pem myownname-$build.jar ec2-user@172.31.14.167:/home/ec2-user/app.jar
ssh -i pipelines.pem ec2-user@172.31.14.167 'sudo yum install java -y && java -jar /home/ec2-user/app.jar'
