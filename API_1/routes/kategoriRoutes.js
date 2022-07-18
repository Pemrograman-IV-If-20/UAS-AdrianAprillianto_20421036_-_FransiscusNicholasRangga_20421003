const router = require('express').Router()
const controllerKategori = require('../controller/kategoriController')

router.post('/input-kategori', (req, res) => {
    controllerKategori.inputKategori(req.body)
    .then((result) => {
      res.json(result)
  }).catch(err => {
      res.json(err)
  })
})



router.put('/updateKategoriById/:id', (req, res) => {
  controllerKategori.updateKategoriById(req.params.id, req.body)
  .then((result) => {
    res.json(result)
  }).catch(err => {
    res.json(err)
  })
})

router.get('/getAllKategori', (req, res) => {
  controllerKategori.getAllKategori()
  .then((result) => {
    res.json(result)
  }).catch(err => {
    res.json(err)
  })
})

router.get('/getKategoriById/:idKategori', (req, res) => {
  controllerKategori.getKategoriById(req.params.idKategori)
  .then((result) => {
    res.json(result)
  }).catch(err => {
    res.json(err)
  })
})

router.delete('/deleteKategori/:idKategori', (req, res) => {
  controllerKategori.deleteKategori(req.params.idKategori)
  .then((result) => {
    res.json(result)
  }).catch(err => {
    res.json(err)
  })
})

module.exports = router