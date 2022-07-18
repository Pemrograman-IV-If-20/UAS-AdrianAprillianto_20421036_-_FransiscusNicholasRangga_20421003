String baseUrl = 'http://192.168.4.34:3000';
//String baseUrl = 'http://localhost:3000';

//users
String signIn = "$baseUrl/users/login";
String signUp = "$baseUrl/users/registrasi";
String updateData = "$baseUrl/users/update";

//barang
String dataBarangRes = "$baseUrl/barang/get-all-barang";

//keranjang
String inputKeranjangRes = "$baseUrl/keranjang/input-keranjang";
String getAllKeranjangRes = "$baseUrl/keranjang/get-all-keranjang";
String updateKeranjangRes = "$baseUrl/keranjang/update-keranjang";
String hapusKeranjangRes = "$baseUrl/keranjang/delete-keranjang";

//transaksi
String transaksiInput = "$baseUrl/transaksi/input";
String getTransaksi = "$baseUrl/transaksi/getTransaksiByIdUser";
String deleteTransaksi = "$baseUrl/transaksi/delete-transaksi";
