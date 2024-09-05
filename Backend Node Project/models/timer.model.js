import { Schema, model } from "mongoose";

const TimerSchema = Schema(
  {
    timerName: {
      type: String,
      required: true,
    },

    workSessions: {
      type: Number,
      required: true,
      default: 0,
    },

    focusedWork: {
      type: Number,
      required: true,
      default: 0,
    },

    timerBreak: {
      type: Number,
      required: true,
    },
    }
  ,
  {
    timestamps: true,
  }
);


const Timer = model("Timer", TimerSchema);

export default Timer;