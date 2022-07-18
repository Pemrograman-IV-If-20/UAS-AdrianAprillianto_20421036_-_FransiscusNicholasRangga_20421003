const router = require('express').Router();
const controllerKeranjang = require('../controller/keranjangController')

router.post('/input-keranjang', (req, res) => {
    controllerKeranjang.input(req.body)
    .then((result) => {
      res.json(result)
  }).catch(err => {
      res.json(err)
  })
})

router.get("/get-all-keranjang/:idUser", (req, res) => {
    controllerKeranjang.getAllKeranjang(req.params.idUser)
    .then((result) => {
        res.json(result)
    }).catch(err => {
        res.json(err)
    })
})

router.get("/get-keranjang-by-id/:idKeranjang", (req, res) => {
    controllerKeranjang.getKeranjangById(req.params.idKeranjang)
    .then((result) => {
        res.json(result)
    }).catch(err => {
        res.json(err)
    })
})

router.put("/update-keranjang/:idKeranjang", (req, res) => {
    controllerKeranjang.updateKeranjang(req.params.idKeranjang, req.body)
    .then((result) => {
        res.json(result)
    }).catch(err => {
        res.json(err)
    })
})

router.delete('/delete-keranjang/:idKeranjang', (req, res) => {
    controllerKeranjang.deleteKeranjang(req.params.idKeranjang)
    .then((result) => {
      res.json(result)
    }).catch(err => {
      res.json(err)
    })
  })


module.exports = router