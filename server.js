// server.js
const express = require("express");
const path = require("path");
const dotenv = require("dotenv").config(); // For local development, loads .env file
const feedgrabRoutes = require("./feedgrab"); // Corrected: Import the feedgrab routes module

const app = express();
// Use process.env.PORT for Render, with a fallback for local development
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.static(path.join(__dirname, "public"))); // Assuming your index.html is in a 'public' folder
app.use(express.json()); // To parse JSON request bodies

// Serve index.html at root
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "index.html")); // Serve from 'public' folder
});

// Use the feedgrab routes
// All routes defined in feedgrabRoutes will be accessible under their paths
app.use(feedgrabRoutes);

// Start the server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
