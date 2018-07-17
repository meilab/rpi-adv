var express = require('express'),
  path = require('path'),
  fs = require('fs'),
  app = express();

//set the port
app.set('port', 3000);

//tell express that we want to use the www folder
//for our static assets
app.use(express.static(path.join(__dirname, '../static')));

// Listen for requests
var server = app.listen(app.get('port'), function () {
  console.log('The server is running on http://localhost:' + app.get('port'));
});

const advVideoDir = path.join(__dirname, '../static/assets/videos')
const advImageDir = path.join(__dirname, '../static/assets/images')

const videoFiles = fs.readdirSync(advVideoDir).map((item) => {
  const completePath = path.join(advVideoDir, item)
  return {
    name: item,
    path: completePath
  }
})

const imageFiles = fs.readdirSync(advImageDir).map((item) => {
  return {
    name: item
  }
})

app.get('/api/v1/videos', (req, res) => res.send(videoFiles))
app.get('/api/v1/images', (req, res) => res.send(imageFiles))
app.get('/assets/videos', (req, res) => res.send("videos"))
app.get('/assets/images', (req, res) => res.send("images"))
