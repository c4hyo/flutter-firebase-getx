import 'package:cloud_firestore/cloud_firestore.dart';

class BarangModel {
  String? id;
  String? namaBarang;
  int? jumlahBarang;
  int? hargaBarang;
  String? keterangan;
  String? imageUrl;

  BarangModel({
    this.id,
    this.imageUrl,
    this.hargaBarang,
    this.jumlahBarang,
    this.keterangan,
    this.namaBarang,
  });

  BarangModel.docSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    namaBarang = snapshot['nama_barang'];
    jumlahBarang = snapshot['jumlah_barang'];
    hargaBarang = snapshot['harga_barang'];
    keterangan = snapshot['keterangan'];
    imageUrl = snapshot['image_url'];
  }
}

List<BarangModel> listBarang = [
  BarangModel(
    jumlahBarang: 12,
    namaBarang: "Kaos Gimank",
    id: "1",
    hargaBarang: 400000,
    imageUrl: "assets/sampel/y.jpg",
    keterangan:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu urna quis ligula bibendum ornare at nec lorem. Cras dapibus convallis dolor, quis ullamcorper sapien euismod a. Mauris elit est, fermentum a felis id, cursus eleifend ipsum. Vivamus imperdiet turpis tellus, eget efficitur arcu molestie quis. Quisque laoreet mi vel porta tincidunt. Praesent hendrerit leo vitae nisi elementum mollis. Vivamus sodales sollicitudin euismod. Nullam lobortis arcu ut neque eleifend, sed congue nisi feugiat. Morbi id mi nec augue placerat hendrerit vitae a ante. Quisque commodo erat eget orci euismod fermentum. Vestibulum non ipsum sed diam sollicitudin ultrices. Ut sit amet scelerisque dolor. Mauris non convallis turpis. Pellentesque nisi nisi, efficitur ac mi in, condimentum consequat velit. Nunc facilisis, eros quis eleifend ullamcorper, augue nisi porttitor lectus, efficitur maximus nulla sem in urna. Aliquam erat volutpat. Pellentesque quis nulla eget orci lacinia molestie. Curabitur finibus ornare nulla, eget convallis justo accumsan a. Etiam auctor mauris lacus, vitae sagittis magna molestie nec. Nulla orci nulla, elementum vitae suscipit vitae, dictum at ligula. Pellentesque eget dapibus purus, sit amet eleifend massa. Morbi magna lectus, accumsan at dui pulvinar, vestibulum condimentum nunc. Donec tincidunt viverra lectus. Donec quis sollicitudin ante. Integer vestibulum elementum magna sed malesuada. Etiam sit amet commodo enim, vitae feugiat erat. Sed blandit nisl nec ipsum faucibus ultricies. Mauris tempor dolor vitae augue hendrerit imperdiet. Sed euismod quis elit et accumsan. Nunc auctor, diam eu consequat lobortis, sem nibh consequat tellus, vel vehicula sem est sit amet urna. Maecenas et ornare risus. Suspendisse vel interdum lorem. Sed posuere cursus turpis, quis malesuada mauris ultricies ut. Suspendisse condimentum sem ac facilisis tempus. Sed aliquam lobortis mauris nec lobortis. Donec mollis malesuada semper. Vivamus varius ac leo ac mattis. Praesent consequat nisl vel dolor luctus, in consectetur tellus elementum. Phasellus a porta urna, vitae aliquam mauris. Nullam hendrerit nisi at elit tempus, non imperdiet quam condimentum. Pellentesque vel odio hendrerit, semper turpis at, tempor lorem. Aliquam erat volutpat. Nullam sit amet nulla laoreet, suscipit nulla et, elementum magna. Cras auctor non orci id maximus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris lobortis, lorem a porta viverra, nisi velit maximus mauris, sed iaculis risus metus a neque. Sed gravida, dolor et cursus pharetra, lacus ligula suscipit ex, accumsan volutpat eros sapien quis nisl. Quisque consequat rhoncus arcu eu volutpat. Suspendisse tortor elit, semper quis magna vel, tincidunt placerat neque. Mauris egestas orci sit amet dui hendrerit, vel fermentum felis venenatis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum maximus orci nec nunc congue luctus. Ut erat metus, faucibus ultricies porta in, interdum sit amet libero. Cras volutpat nunc commodo leo ullamcorper, sed porta sapien dignissim. Mauris enim mi, aliquet ac porttitor a, sagittis eu orci. Suspendisse tempus blandit erat, id dictum leo fermentum id.",
  ),
  BarangModel(
    jumlahBarang: 17,
    namaBarang: "Kursi Gimank",
    id: "2",
    hargaBarang: 10000,
    imageUrl: "assets/sampel/y.jpg",
    keterangan: "kosong",
  ),
  BarangModel(
    jumlahBarang: 20,
    namaBarang: "Kursi Kantor",
    id: "3",
    hargaBarang: 500000,
    imageUrl: "assets/sampel/y.jpg",
    keterangan: "kosong",
  ),
  BarangModel(
    jumlahBarang: 12,
    namaBarang: "Keyboard",
    id: "4",
    hargaBarang: 20000,
    imageUrl: "assets/sampel/y.jpg",
    keterangan: "kosong",
  ),
];
