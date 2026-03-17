import express from "express";
import { getCountryInfo } from "../controllers/aiController.js";

const router = express.Router();

router.post("/travel-info", getCountryInfo);

export default router;
