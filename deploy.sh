echo "Building app..."
./mvnw clean package

echo "Deploy files to server..."
scp -r -i ~/Desktop/demo-swp target/demo-swp.jar root@206.189.158.35:/var/www/demo-swp-be/

ssh -i ~/Desktop/demo-swp root@206.189.158.35 <<EOF
pid=\$(sudo lsof -t -i :8080)

if [ -z "\$pid" ]; then
    echo "Start server..."
else
    echo "Restart server..."
    sudo kill -9 "\$pid"
fi
cd /var/www/demo-swp-be
java -jar demo-swp.jar
EOF
exit
echo "Done!"
