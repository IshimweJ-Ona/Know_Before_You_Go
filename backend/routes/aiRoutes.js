import express from "express";
import { handleQuery } from "../controllers/aiController.js";

const router = express.Router();

router.post("/query", handleQuery);

export default router;
