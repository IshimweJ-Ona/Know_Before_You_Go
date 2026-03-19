import express from "express";
import {
    listCountries,
    getCountry,
    getVisa,
    getHealth,
    getEmergency,
    getDosDonts,
    getCountryAssistant,
    createNewsletter,
    listSubscribers,
    createAdmin,
    loginAdmin,
    listFeedback,
    updateCountryAdmin,
    signupSubscriber,
    loginSubscriber,
    getNews,
    getAds,
    aiChat,
} from "../controllers/v1Controller.js";
import { requireAdmin } from "../middleware/auth.js";

const router = express.Router();

router.get("/countries", listCountries);
router.get("/countries/:code", getCountry);
router.get("/countries/:code/assistant", getCountryAssistant);
router.get("/visa/:code", getVisa);
router.get("/health/:code", getHealth);
router.get("/emergency/:code", getEmergency);
router.get("/dosDonts/:code", getDosDonts);
router.post("/newsletter", createNewsletter);
router.post("/admin", createAdmin);
router.post("/admin/login", loginAdmin);

router.get("/admin/subscribers", requireAdmin, listSubscribers);
router.get("/admin/feedback", requireAdmin, listFeedback);
router.patch("/admin/countries/:code", requireAdmin, updateCountryAdmin);

// Subscriber routes
router.post("/subscriber/signup", signupSubscriber);
router.post("/subscriber/login", loginSubscriber);

// News and Ads
router.get("/news", getNews);
router.get("/ads", getAds);

// AI Chat
router.post("/chat", aiChat);

export default router;
