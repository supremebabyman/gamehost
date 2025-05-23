const express = require("express");
const fetch = require("node-fetch");
const path = require("path");
const dotenv = require("dotenv").config();
const app = express();
const PORT = 3000; // CodeSandbox assigns this

const DISCORD_WEBHOOK_URL = process.env.webfeed;

// Middleware
app.use(express.static(__dirname));
app.use(express.json());

// Serve index.html at root
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "index.html"));
});

// Feedback route
app.post("/submit-feedback", async (req, res) => {
  const feedback = req.body.feedback;
  const timestamp = new Date().toISOString();
  const message = `📩 **New Feedback Submitted**\n🕒 ${timestamp}\n💬 ${feedback}`;

  try {
    const response = await fetch(DISCORD_WEBHOOK_URL, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ content: message }),
    });

    const result = await response.text();
    console.log("Discord response:", result);

    if (!response.ok) throw new Error("Discord webhook failed");

    res.json({ message: "Feedback submitted successfully!" });
  } catch (error) {
    console.error("Error sending to Discord:", error);
    res.status(500).json({ message: `Failed: ${error.message}` });
  }
});

// ✅ Start only with environment-assigned port
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
