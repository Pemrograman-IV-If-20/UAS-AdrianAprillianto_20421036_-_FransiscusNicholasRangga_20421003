const kategoriModel = require('../models/kategoriModels');
const objectId = require('mongoose').Types.ObjectId;

exports.inputKategori = (data) => 
    new Promise(async (resolve, reject) => {
      console.log(data);
      kategoriModel.findOne({namaKategori: data.namaKategori})
        .then((kategori) => {
          
            if(kategori && data.namaKategori.toLowerCase() == 
            kategori.namaKategori.toLowerCase()) {
              console.log(data.namaKategori.toLowerCase()
            == kategori.namaKategori.toLowerCase())
              return reject({
                status: false,
                msg: 'Nama kategori sudah tersedia, silahkan input dengan nama kategori lain'
              })
            
            }

            kategoriModel.create(data).then(() => {
              resolve({
                status: true,
                msg: 'Berhasil menambahkan kategori'
              })
            }).catch(err => {
              reject({
                status: false,
                msg: 'Terjadi kesalahan pada server'
              })
            })
          
        }).catch((err) => {
          reject({
            status: false,
            msg: 'Terjadi kesalahan'
          })
        })
    })

    exports.updateKategoriById =(id, data) => 
    new Promise((resolve, reject) => {
      console.log(data, objectId(id))
      kategoriModel.findOne({_id: objectId(id)})
        .then((kategori) => {
          if (kategori) {
            kategoriModel.updateOne({_id: objectId(id)}, data)
              .then(() => {
                resolve({
                  status: true,
                  msg: 'Berhasil mengubah kategori',
                  tes: data
                })
              }).catch(err => {
                reject({
                  status: false,
                  msg: 'Terjadi kesalahan pada server'
                })
              })
          } else {
            reject({
              status: false,
              msg: 'Kategori tidak ditemukan'
            })
          }
        })
        .catch((error)=>{
          reject({
            status: false,
            msg: 'Terjadi kesalahan'
          })
        })
    })

    exports.getAllKategori = () => 
    new Promise((resolve, reject) => {
      kategoriModel.find().then((kategori) => {
          if (kategori.length > 0){
            resolve({
              status: true,
              msg: 'Berhasil memuat data kategori',
              data: kategori
            })
          } else {
            reject({
              status: false,
              msg: 'Tidak ada data'
            })
          }
      })
    }).catch(err => {
      reject({
        status: false,
        msg: 'Terjadi kesalahan pada server'
      })
    })

    exports.getKategoriById = (idKategori) => 
    new Promise((resolve, reject) => {
      kategoriModel.findOne({_id: objectId(idKategori)})
      .then((kategori) => {
          if (kategori) {
            resolve({
              status: true,
              msg: 'Berhasil memuat data ['+idKategori+']',
              data: kategori
            })
          } else {
            reject({
              status: false,
              msg: 'Tidak ada data'
            })
          }
      }).catch(err => {
        reject({
          status: false,
          msg: 'Terjadi kesalahan pada server'
        })
      })
    })

    exports.deleteKategori = (idKategori) => 
    new Promise((resolve, reject) => {
      kategoriModel.deleteOne({_id: objectId(idKategori)})
      .then(() => {
            resolve({
              status: true,
              msg: 'Berhasil menghapus data ['+idKategori+']',
            })
      }).catch(err => {
        reject({
          status: false,
          msg: 'Terjadi kesalahan pada server'
        })
      })
    })