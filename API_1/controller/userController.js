const userModel = require('../models/userModels')
const mongoose = require('mongoose');
const objectId = mongoose.Types.ObjectId;
//const objectId = require('mongoose').Types.ObjectId;
const bcrypt = require('bcrypt')

exports.registrasiUser = (data) =>
    new Promise(async (resolve, reject) => {

        const salt = bcrypt.genSaltSync(10)
        const encript = bcrypt.hashSync(data.password, salt)
        Object.assign(data, {
            password: encript
        })
        userModel.findOne({
            email: data.email
        }).then((sudahAdaUser) => {
            if (sudahAdaUser) {
                reject({
                    msg: 'Email sudah terdaftar'
                })
            } else {
                userModel.create(data)
                .then(() => {
                    resolve({
                        status: true,
                        msg: 'Berhasil membuat user baru'
                    })
        
                }).catch(err => {
                    reject({
                        status: false,
                        msg: 'Terjadi kesalahan pada server'
                    })
                })
            }
        })
        
    })

exports.loginUser = (data) =>
    new Promise ( async (resolve, reject) => {
        const {userName, password} = data

        console.log(">> Akun ["+userName+"] Telah login ke aplikasi!");

        userModel.findOne({userName: userName})
            .then((user) => {
                if (user) {
                    const isValid = bcrypt.compareSync(password, user.password)

                    if (!isValid) {
                        return reject({
                            status: false,
                            msg: 'password salah!'
                        })
                    }

                    resolve({
                        status: true,
                        msg: "login berhasil",
                        data: user
                    })

                } else {
                    reject({
                        status: false,
                        msg: 'Akun anda tidak terdaftar! Silahkan register akun!'
                    })

                }
            })
    })

    exports.update = (idUser, data) =>
    new Promise((resolve, reject) => {
        userModel.updateOne({_id: objectId(idUser)}, data)
        .then(() => {
            resolve({
              status: true,
              msg: 'Berhasil mengubah data user!',
              tes: data
            })
        }).catch(err => {
            reject({
              status: false,
              msg: 'Terjadi kesalahan pada server'
            })
          })
    })