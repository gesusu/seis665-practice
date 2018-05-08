properties([pipelineTriggers([githubPush()])])
node('linux'){
   
        stage('Setup') {
            steps {
	      git credentialsId: 'github-account', url: 'https://github.com/gesusu/seis665-practice.git'
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
		sh 'curl -s 10.120.1.42'
		sh 'docker stop classweb1'
		sh 'docker rm classweb1'
            }
        }
   }
