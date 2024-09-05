import express, { json, urlencoded } from "express";
import { connect } from "mongoose";
import timerRoute from "./routes/timer.route.js";
import cors from "cors";
const app = express();

// middleware


app.use(cors());
app.use(json());
app.use(urlencoded({extended: false}));


// routes
app.use("/api/timers", timerRoute);




app.get("/", (req, res) => {
  res.send("Hello from Node API Server Updated");
});


connect(
    "mongodb+srv://mhernandezm92:drWeEQ73CNDsV8b6@cluster0.rqb7c.mongodb.net/timerApp?retryWrites=true&w=majority&appName=Cluster0"
  )
  .then(() => {
    console.log("Connected to database!");
    app.listen(3000, () => {
      console.log("Server is running on port 3000");
    });
  })
  .catch(() => {
    console.log("Connection failed!");
  });
