# There are some packages that phantomjs requires and I'm currently too lazy to
# script this via Chef
sudo apt-get install --yes --force-yes libfontconfig1 fontconfig libfontconfig1-dev libfreetype6-dev

# Set some environment variables so that the npm install works
export NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript;
export HOME=/home/vagrant;

# Clean up any failed phantomjs installs
rm -rf /tmp/phantomjs;

# Let's install the NPM requirements
sudo npm install -g grunt-cli;
cd /home/vagrant/wym;
npm install;

# Add grunt-cli autocompletion
grep -q 'eval "$(grunt --completion=bash)"' /home/vagrant/.bashrc || echo 'eval "$(grunt --completion=bash)"' >> /home/vagrant/.bashrc
