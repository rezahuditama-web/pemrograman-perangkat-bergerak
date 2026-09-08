class profil {
  String nama;
  String nim;
  String? email;
  profil({
    required this.nama, required this.nim, this.email,
  });

  void inpo(){
  print('Nim:$nim, Nama:$nama, Email:${email??'Belum ada email'}');
}
}

void main(){
  profil profil1= profil(nama:'Reza', nim: '362552102', email: 'rezamancing@gmail.com');
  profil profil2= profil(nama: 'Rezi', nim: '3625520002');
  profil1.inpo();
  profil2.inpo();
}