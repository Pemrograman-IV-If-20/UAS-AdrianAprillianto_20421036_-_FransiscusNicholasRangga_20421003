const router = require('express').Router();
const controllerTransaksi = require('../controller/transaksiController')

router.post("/input", (req, res) => {
    controllerTransaksi.inputTransaksi(req.body)
    .then((result) => {
        res.json(result)
    }).catch(err => {
        res.json(err)
    })
})

router.get("/get-all-transaksi", (req, res) => {
    controllerTransaksi.getAllTransaksi()
    .then((result) => {
        res.json(result)
    }).catch(err => {
        res.json(err)
    })
})

router.get("/get-transaksi-get-by-id/:idTransaksi", (req, res) => {
    controllerTransaksi.getTransaksiById(req.params.idTransaksi)
    .then((result) => {
        res.json(result)
    }).catch(err => {
        res.json(err)
    })
})

router.get("/getTransaksiByIdUser/:idUser", (req, res) => {
    controllerTransaksi.getTransaksiByIdUser(req.params.idUser)
    .then((result) => {
        res.json(result)
    }).catch(err => {
        res.json(err)
    })
})

router.delete('/delete-transaksi/:idTransaksi', (req, res) => {
    controllerTransaksi.deleteTransaksi(req.params.idTransaksi)
    .then((result) => {
      res.json(result)
    }).catch(err => {
      res.json(err)
    })
  })

module.exports = router