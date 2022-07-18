const router = require('express').Router();
const controllerBarang = require('../controller/barangController')
const utilApps = require('../utils/utils_apps')
const multer = require('multer');
const barangModels = require('../models/barangModels');
const uploadFile = multer({
    storage: utilApps.uploadFile
}).single("gambar");

router.post('/input', uploadFile, (req, res) => {
    if(req.file === undefined){
        res.json({
            status: false,
            msg: "File gambar tidak boleh kosong"
        })
    } else {
        req.body.gambar = req.file.filename
    }

    controllerBarang.input(req.body)
    .then((result) => {
      res.json(result)
  }).catch(err => {
      res.json(err)
  })
})

router.get("/get-all-barang", (req, res) => {
    controllerBarang.getAllBarang()
    .then((result) => {
        res.json(result)
    }).catch(err => {
        res.json(err)
    })
})

router.get("/get-barang-byId/:idBarang", (req, res) => {
    controllerBarang.getBarangById(req.params.idBarang)
    .then((result) => {
        res.json(result)
    }).catch(err => {
        res.json(err)
    })
})

router.put("/update/:idBarang", uploadFile, (req, res) => {
    if(req.file !== undefined) {
        req.body.gambar = req.file.filename
    }

    controllerBarang.update(req.params.idBarang, req.body)
    .then((result) => {
        res.json(result)
    }).catch(err => {
        res.json(err)
    })
})

router.delete('/delete/:idBarang', (req, res) => {
    controllerBarang.delete(req.params.idBarang)
    .then((result) => {
      res.json(result)
    }).catch(err => {
      res.json(err)
    })
  })


module.exports = router