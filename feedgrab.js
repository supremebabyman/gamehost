import { DISCORD_WEBHOOK_URL, fetch, app } from "../server.js";

app.post("/submit-feedback", async (req, res) => {
  try {
    const feedback = req.body.feedback;
    console.log("Received feedback:", feedback);

    if (!feedback) {
      return res.status(400).json({ message: "Feedback is required" });
    }

    const timestamp = new Date().toISOString();
    const message = `📩 **New Feedback Submitted**\n🕒 ${timestamp}\n💬 ${feedback}`;

    const response = await fetch(DISCORD_WEBHOOK_URL, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ content: message }),
    });

    if (!response.ok) {
      const errorText = await response.text();
      console.error("Discord webhook response error:", errorText);
      throw new Error("Discord webhook failed");
    }

    res.json({ message: "Feedback submitted successfully!" });
  } catch (error) {
    console.error("Error in /submit-feedback:", error.stack || error);
    res.status(500).json({ message: "Failed to send feedback." });
  }
});
