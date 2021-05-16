require("dotenv").config()
const jwt = require("jsonwebtoken");

module.exports = async (payload, expTime) => {
  try {
    return jwt.sign(
      payload,
      process.env.JWT_SECRET,
      { expiresIn: expTime }
    );
  } catch (error) {
    if (error.message.includes('secretOrPrivateKey'))
      throw new Error('Please set JWT SECRET');
    throw new Error(error.message);
  }
};
