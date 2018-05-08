 node['linux']{
       label'linux'
   
    stages {
        stage('Setup') {
            steps {
	      git credentialsId: 'github-account', url: 'https://github.com/seis665/assignment-11-docker-gesusu.git'
  		echo "Copying from  s3 bucket......."
		sh 'aws s3 cp s3://gbjenkins.com/assignment11/classweb.html  index.html'
            }
        }
    stage('Build') {
            steps {
                echo 'Building..'
		sh 'docker build -t classweb:1.0 .' 
            }
        }
    stage('Test') {
            steps {
                echo 'Testing....'
		sh 'docker run -d -p 80:80 --env NGINX_PORT=80 --name classweb1 classweb:1.0'
		sh 'curl -s 10.120.1.218'
		sh 'docker stop classweb1'
		sh 'docker rm classweb1'
            }
        }
   }
}
