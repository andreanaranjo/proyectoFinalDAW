// vue.config.js
module.exports = {
    // options...
    publicPath: process.env.NODE_ENV === 'production'
    ? '/app/'
    : '/',
    outputDir: '../../public/app'
  }