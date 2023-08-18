Udemy course: https://www.udemy.com/course/docker-and-kubernetes-the-complete-guide/learn/lecture/11514730#overview

Goal of the project is to create a production ready k8s deployment for the complex app created earlier.

Notes:

To Combine Configuration files use --- as the separator.

docker run -it -v ${pwd}:/app ruby:2.3 sh

gem install travis --no-rdoc --no-ri

travis encrypt-file service-account.json -r adewanganbuild/k8-complex

Add encrypted service_account.json.enc file

Travis does not have built in support for kubernetes, hence use custom script.

