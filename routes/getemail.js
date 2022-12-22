const express = require("express");
const router = express.Router();
const redis = require("redis");
const randomInt = require("random-int");
const conn = require("../database/connection");

const REDIS_PORT = process.env.PORT || 6379;

const client = redis.createClient(REDIS_PORT);

async function getEmail(req, res, next) {
  try {
    console.log("Getting email from db...");
    const userid = req.body.userid;
    conn.query(`SELECT company FROM mail_company WHERE mail_type IN ( SELECT mail_type FROM mail WHERE email IN ( SELECT email FROM users WHERE id="${userid}" ) )
    `, (err, rows) => {
      if (err) {
        res.json(err);
      }
      console.log(rows);
      //send data to redis
      client.setex(userid, randomInt(3600, 4200), rows[0].company);
      res.render("repos", { email_result: rows[0].company });
    });
  } catch (err) {
    console.error(err);
    res.status(500);
  }
}

// cache middleware
function cache(req, res, next) {
  const userid = req.body.userid;
  client.get(userid, (err, data) => {
    if (err) throw err;

    if (data !== null) {
        console.log("cache hit!!!");
      res.render("repos", { email_result: data });
    } else {
      next();
    }
  });
}

router.post("/", cache, getEmail);
router.get("/", (req, res, next) => {
  res.render("repos");
});

router.get("");

module.exports = router;
