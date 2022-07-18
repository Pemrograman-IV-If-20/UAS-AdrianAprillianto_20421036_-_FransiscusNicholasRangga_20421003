const express = require('express')
const app = express()
const mongoose = require('mongoose')
const dbConfig = require('./config/dbConfig')


app.use(express.json())

app.use(express.urlencoded({
    extended: true
}))

mongoose.connect(dbConfig.mongoUrl, {
    useUnifiedTopology: true,
    useNewUrlParser: true

}).then(() => {
    console.log('\x1b[35m%s\x1b[0m', "[API] Berhasil konek ke mongodb")
}).catch(err => {
    console.log(err)
})

const port = 3000
app.listen(port, () => {
    console.log('\x1b[35m%s\x1b[0m', '[API] Server berjalan di port ['+port+']')

})

app.get('/', function (req, res) {
  res.send('Selamat Datang di API')
})

app.use('/users', require('./routes/userRoutes'))
app.use('/kategori', require('./routes/kategoriRoutes'))
app.use('/barang', require('./routes/barangRoutes'))
app.use('/public', express.static('public'))
app.use('/keranjang', require('./routes/keranjangRoutes'))
app.use('/transaksi', require('./routes/transaksiRoutes'))