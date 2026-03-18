import express from "express";
import { detectCountryFromQuery } from "../controllers/countryController.js";

const router = express.Router();

router.post("/detect", detectCountryFromQuery);

export default router;
