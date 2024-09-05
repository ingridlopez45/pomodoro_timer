import { Router } from "express";
const router = Router();
import { getTimers, getTimer,updateTimer, deleteTimer, createTimer} from '../controllers/timer.controller.js';


router.get('/', getTimers);
router.get("/:id", getTimer);

router.post("/", createTimer);

// update a timer 
router.put("/:id", updateTimer);

// delete a timer 
router.delete("/:id", deleteTimer);




export default router;