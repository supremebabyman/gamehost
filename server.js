const express = require("express");
const fetch = require("node-fetch");
const path = require("path");
const app = express();
const PORT = process.env.PORT || 3000;
const port = PORT;
// Using node-fetch v2

const DISCORD_WEBHOOK_URL =
  "https://discord.com/api/webhooks/1374920243482329129/OQnFTa7uZ30a7B3rfjm85O8Z163_06HhSAnJVrKe7hYn87ZyNc0XOB-2OzPmfW2lvN29";

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});

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

    const result = await response.text(); // Add this
    console.log("Discord response:", result); // Add this

    if (!response.ok) throw new Error("Discord webhook failed");

    res.json({ message: "Feedback submitted successfully!" });
  } catch (error) {
    console.error("Error sending to Discord:", error);
    res.status(500).json({ message: `Failed: ${error.message}` });
  }
});
