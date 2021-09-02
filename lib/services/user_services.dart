part of 'services.dart';

class UserSevices {
  static Future<ApiReturnValue<User>> signIn(
      String email, String password) async {
    await Future.delayed(Duration(microseconds: 500));
    // * di buat static method siginIn di buat future karena asincronus email dan password itu akan di kirim ke backend
// * di kasi delay 500 mili detik untuk membuat delay
//  * kemudian kembalikan mock user untuk karena belum ada apinya

    return ApiReturnValue(value: mockUser);
    // return ApiReturnValue(message: 'Wrong email or passwors');
    // * kode diatas di gunakan ketika testing gagal login
  }

// * di buat method sign Up dan import dart io serta package http
  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {File pictureFile, http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    //*baseUrl liat di services.dart
    String url = baseUrl + 'register';

    //* di buat var yang akan di simppan dengan nama response
    //* await tunggu client dari method post (tergantung dari apinya ada post, get dan lainya)
    //* ambil dari url url di atas
    //* headers disi sesuai dengan yang ada di API register kemudian liat bagian header maka tulisanya sama percis 'apilcation/json
    //* body di isi seuai dengan yang ada di API register
    //* name di isi dengan user . sesuai dengan yang ada di api isi body

    var response = await client.post(Uri.parse(url),
        headers: {'Conten-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          'name': user.name,
          'email': user.email,
          'password': password,
          'password_confirmation': password,
          'address': user.address,
          'city': user.city,
          'houseNumber': user.houseNumber,
          'phoneNumber': user.phoneNumber,
        }));

    //* if jika response di atas tidak sama dengan 200 atau tidak konek
    //* kembalikan api return value dengan pesan please try again
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please Try Again');
    }

    //* jika response sama dengan 200 maka
    //* di buat var yang di simoan dengan nama data jsonDecode respon body
    var data = jsonDecode(response.body);

    //* User.token di ambil dari user_models/ static token
    //* sama dengan data di atas kemudian ['data']['token'] di ambil dari api
    //* kalau berhasil register maka kembalianya adalah data kemudian di dalam data ada access token
    //* kemudian akan di kembalikan User value yang berisi data di atas di dalam data yang berisi user
    User.token = data['data']['access_token'];
    User value = data['data']['user'];

    // todo: upload picture
    //* tadinya ini kosong di isi terakhir setelah selesai fungsi uploadProfilePicture makanya ada peringata di atas
    //* if jika pictureFile tidak sama dengan null maka kembalikan ApiReturnValue of string yang akan di simpan di result
    //* await tunggu uploadProfilePicture dengan isi fungsi picture file (lihat di baris 18)
    //* kemudian di kondisikan lagi if jika nilai value result tidak sama dengan null
    //* maka value di ubah menjadi vallue.copywith picturePath yang ada di user_models.dart
    //* yang picturePath berada di 'http://foodmarket-backend.buildwithangga.id/storage/' + result.value

    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadProfilePicture(pictureFile);
      if (result.value != null) {
        value = value.copyWith(
            picturePath:
                'http://foodmarket-backend.buildwithangga.id/storage/' +
                    result.value);
      }
    }
    //* kembalikan return api return value dengan isi nilai value yang baru (di atas)
    return ApiReturnValue(value: value);
  }

  //* di buat method uploadProfielPicture untuk upload foto profile
  //* di buat static future of api return value of string dengan nama fungsi uploadProfilePicture
  //* yang mengandung File dari dart.io berisi pictureFile, kemudian dengan optional
  //* http dengan MultipartRequest ( multi part request adalah Permintaan semacam itu memiliki string [bidang], yang berfungsi sebagai bidang formulir normal, dan [file] biner (berpotensi dialirkan).
  //* Permintaan ini secara otomatis menyetel header Content-Type ke multipart/form-data. Nilai ini akan menggantikan nilai apa pun yang ditetapkan oleh pengguna. )
  //*  dengan riquest kemudian asingkronus
  //*  di buat pergabungan antara baseUrl + user/photo yang di simpan dalam string url
  //* di buar var dengan nama uri yang mengandung Uri.parse(url 'url yang di buat di atas')
  static Future<ApiReturnValue<String>> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest request}) async {
    String url = baseUrl + 'user/photo';
    var uri = Uri.parse(url);

    //* if jika request sama dengan null maka
    //* request yang berasal dari multiplerequest dengan nama request (line 93)
    //* mengandung http.MultipartRequest dengan fungsi POST (POST berasal dari jenis Apinya yaitu POST)  dan uri yang di buat di atas
    //* kemudian map heads yang berisi list content type sama dengan application/json ini bisa dilihat di api register
    //* kemudian header authorization yang berisi Bearer + User.token yang di ambil dari user_models/ static token
    // ignore: prefer_conditional_assignment
    if (request == null) {
      request = http.MultipartRequest('POST', uri)
        ..headers['Content-Type'] = 'application/json'
        ..headers['Authorization'] = 'Bearer  ${User.token}';
    }

    //* di buat var dengan nama multipartFile yang berasal dari http.MultipartFile yang berisi file yang di upload
    //* tunggu respon dari multipartfile from path di lokasi 'file' di lokasi File pictureFIle.path
    //* kemudian request file tambahkan multipartFile
    var multipartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);
    request.files.add(multipartFile);

    //* di buat var response yang memuai await request.send()
    var response = await request.send();

    //* if jika response status code sama dengan 200 atau berhasil konek maka
    //* di buat string yanng bernama responseBody sama dengan await response strea, (Aliran dari mana data badan respons dapat dibaca.Ini harus selalu menjadi aliran langganan tunggal.)
    //* kemudian ubah bytes menjadi string
    //* di buat var data yang berisi dari jsonDecode responseBody
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      //* di buat string dengan nama imagePath yang mengandung data di atas baru di buat dengan isi data di api['data']['0']
      String imagePath = data['data'][0];

      //* kembalikan return api return value dengan isi nilai imagePath
      //* kalau gagal kembalikan pesan upload profile picture failed
      //* setelah ini selesai baru mengerjakan TODO upload picture
      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: 'Uploading Profile Picture Failed');
    }
  }
}
