const crypto = require('crypto')
  const hash = crypto.createHash('sha512')
  hash.setEncoding('base64')
  const fs = require('fs')
  let file = 'SmartConnect.exe'
  let options = undefined
  let rs = fs.createReadStream(file, {
    ...options,
    highWaterMark: 1024 * 1024
  })
  rs.on('data', (data) => {
    hash.update(data)
  })

  rs.on('end', () => {

    hash.digest()
    hash.end()
    console.log(hash.read())
  })
