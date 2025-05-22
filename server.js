const express = require("express");
const fs = require("fs");
const path = require("path");
const app = express();
const PORT = process.env.PORT || 3040;

app.use(express.static("."));
app.use(express.json());

// Feedback submission route
app.post("/submit-feedback", (req, res) => {
  const feedback = req.body.feedback;
  const timestamp = new Date().toISOString();
  const entry = `\n[${timestamp}]\n${feedback}\n`;

  const filePath = path.join(__dirname, "feedback.txt");

  fs.appendFile(filePath, entry, (err) => {
    if (err) {
      console.error("Error writing to file:", err);
      return res.status(500).json({ message: "Failed to save feedback." });
    }
    res.json({ message: "Feedback submitted successfully!" });
  });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
