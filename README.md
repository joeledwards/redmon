Redmon requires either node.js v0.12+ or io.js. 


To install node.js v0.12

```bash
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get install -y nodejs
```


To install io.js

```bash
curl -sL https://deb.nodesource.com/setup_iojs_1.x | sudo bash -
sudo apt-get install -y iojs
```


Once either node.js or io.js is installed, you will need to install coffee-script:

```bash
sudo npm install -g coffee-script
```


Now you can run redmon:

```bash
./redmon.coffee
```

