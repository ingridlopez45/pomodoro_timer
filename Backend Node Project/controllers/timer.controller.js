import Timer from "../models/timer.model.js";

export const getTimers = async (req, res) => {
  try {
    const timers = await Timer.find({});
    res.status(200).json(timers);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const getTimer = async (req, res) => {
  try {
    const { id } = req.params;
    const timer = await Timer.findById(id);
    res.status(200).json(timer);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const createTimer = async (req, res) => {
  try {
    const timer = await Timer.create(req.body);
    res.status(200).json(timer);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const updateTimer = async (req, res) => {
  try {
    const { id } = req.params;

    const timer = await Timer.findByIdAndUpdate(id, req.body);

    if (!timer) {
      return res.status(404).json({ message: "Timer not found" });
    }

    const updatedTimer = await Timer.findById(id);
    res.status(200).json(updatedTimer);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const deleteTimer = async (req, res) => {
  try {
    const { id } = req.params;

    const timer = await Timer.findByIdAndDelete(id);

    if (!timer) {
      return res.status(404).json({ message: "Timer not found" });
    }

    res.status(200).json({ message: "TImer was deleted successfully" });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
