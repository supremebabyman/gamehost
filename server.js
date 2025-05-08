const express = require('express');
const path = require('path');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname)));

// Optional: handle 404.html
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, '404.html'));
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
