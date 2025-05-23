// feedgrab.js
const express = require("express");
const fetch = require("node-fetch"); // Required for making HTTP requests

// Create an Express Router instance
const router = express.Router();

// Corrected environment variable access for Discord webhook URL
const DISCORD_WEBHOOK_URL = process.env.webfeed;

// Feedback route definition
// Use router.post instead of app.post
router.post("/submit-feedback", async (req, res) => {
  try {
    const feedback = req.body.feedback;
    console.log("Received feedback:", feedback);

    // Basic validation for feedback content
    if (!feedback) {
      return res.status(400).json({ message: "Feedback is required" });
    }

    const timestamp = new Date().toISOString();
    const message = `📩 **New Feedback Submitted**\n🕒 ${timestamp}\n💬 ${feedback}`;

    // Ensure the webhook URL is defined before attempting to fetch
    if (!DISCORD_WEBHOOK_URL) {
      console.error(
        "DISCORD_WEBHOOK_URL is not defined. Please set it in environment variables."
      );
      return res
        .status(500)
        .json({
          message: "Server configuration error: Discord webhook URL missing.",
        });
    }

    // Send feedback to Discord webhook
    const response = await fetch(DISCORD_WEBHOOK_URL, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ content: message }),
    });

    // Check if the Discord webhook request was successful
    if (!response.ok) {
      const errorText = await response.text();
      console.error(
        "Discord webhook response error:",
        response.status,
        errorText
      );
      throw new Error(
        `Discord webhook failed with status ${response.status}: ${errorText}`
      );
    }

    // Respond to the client that feedback was submitted successfully
    res.json({ message: "Feedback submitted successfully!" });
  } catch (error) {
    // Log detailed error and send a generic error message to the client
    console.error("Error in /submit-feedback:", error.stack || error);
    res
      .status(500)
      .json({ message: "Failed to send feedback. Please try again later." });
  }
});

// Export the router so it can be used by server.js
module.exports = router;
