const express = require("express");
const fetch = require("node-fetch");
const path = require("path");
const app = express();
const PORT = process.env.PORT || 3000;

const DISCORD_WEBHOOK_URL =
  "https://discord.com/api/webhooks/1374920243482329129/OQnFTa7uZ30a7B3rfjm85O8Z163_06HhSAnJVrKe7hYn87ZyNc0XOB-2OzPmfW2lvN29";

// Middleware
app.use(express.static(__dirname)); // Serve static files like index.html
app.use(express.json()); // Parse incoming JSON

// ✅ Serve index.html at root

app.get("/", (req, res) => {
  const filePath = path.join(__dirname, "index.html");
  console.log("Sending file from:", filePath);
  res.sendFile(filePath);
});

// ✅ Feedback route
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

// ✅ Start server (ONLY ONCE!)
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
