import 'dart:io';
import 'dart:convert';
void ShowWord(int w) // in giá trị
{
  for (int i = 1; i <= 8; i++) // 8 chữ số hexa
      {
    int hexan = (w >> 32 - i * 4) & 0xF;
    stdout.write(hexan.toRadixString(16).toUpperCase());
  }
}

int RotWord(int w) {
  // 4 byte dich trai
  int byte1 = (w >> 24) & 0xFF;
  int byte234 = w & 0xFFFFFF;
  int rot = (byte234 << 8) | byte1;
  // stdout.write("\nRotword(${w.toRadixString(16).toUpperCase()}) : ");ShowWord(rot);
  return rot;
}
int SubWord(int w)
{
      List<int> S = [
        0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01,0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
        0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,
        0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15,
        0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75,
        0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84,
        0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF,
        0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8,
        0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2,
        0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73,
        0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB,
        0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79,
        0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08,
        0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A,
        0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E,
        0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF,
        0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16
       ];
      int kq = 0;
    for(int i = 1; i <= 4; i++)
    {
        int byte1 = (w >> (32 - i * 8)) & 0xFF ;
        int subB = S[byte1];
        kq = (kq << 8) | subB;
    }
    // stdout.write("\nSubword(${w.toRadixString(16).toUpperCase()}) : ");
    // ShowWord(kq);
      return kq;
}
                  int XorRcon( int w, int j)
                      {
                          List<int> Rc = [
                          0x8d, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36, 0x6c, 0xd8, 0xab, 0x4d, 0x9a,
                          0x2f, 0x5e, 0xbc, 0x63, 0xc6, 0x97, 0x35, 0x6a, 0xd4, 0xb3, 0x7d, 0xfa, 0xef, 0xc5, 0x91, 0x39
                          ];
                          int byte1 = (w >> 24) & 0xFF;
                          int kqXor = (byte1 ^ Rc[j]) & 0xFF;  // lay 1 byte
                          int byte234 = w & 0xFFFFFF;
                          int kq = (kqXor << 24 ) | byte234;
                          return kq;
                      }
                  int G(int w, int j)
                      {
                          int rotW = RotWord(w);
                          int subW = SubWord(rotW);
                          int kq = XorRcon(subW, j);
                          // stdout.write("\G(${w.toRadixString(16).toUpperCase()}) : ");
                          // ShowWord(kq);
                          return kq;
                      } // 44 - 48 -56
                  List<int> KeyExpansion(List<int> Key)
                      {
                        List<int> w = List.filled(44,0) ;
                        w[0] = Key[0];
                        w[1] = Key[1];
                        w[2] = Key[2];
                        w[3] = Key[3];
                        for(int i = 4; i < 44; i++)
                        {
                            if(i % 4 == 0) w[i] = G(w[i-1], (i/4).floor()) ^ w[i - 4];
                            else w[i] = w[i-1] ^ w[i-4];
                            // stdout.write("\n w(${i}) : ");
                            // ShowWord(w[i]);
                        }
                        return w;
                      }
                  List<int> AddRoundKey(List<int> state, List<int> K)
                      {
                     List<int> kq = List.filled(4,0);
                     kq[0] = state[0] ^ K[0];
                     kq[1] = state[1] ^ K[1];
                     kq[2] = state[2] ^ K[2];
                     kq[3] = state[3] ^ K[3];
                     // stdout.write("\nAddRoundKey\n");
                     // for(int i = 0 ; i < 4; i++){
                     //   stdout.write("\n\t");
                     //   ShowWord(kq[i]);
                     // }
                     return kq;
                    }
                  List<int> SubBytes(List<int> state)
                      {
                        List<int> kq = List.filled(4,0);
                          for (int i = 0; i < 4; i++)
                                kq[i] = SubWord(state[i]);
                      //           stdout.write("\nSubWord\n");
                      //         for(int i = 0 ; i < 4; i++){
                      //             stdout.write("\n\t");
                      //             ShowWord(kq[i]);
                      // }
                        return kq;
                  }
                  List<int> ShiftRows(List<int> state)
                      {
                        List<int> kq = List.filled(4,0);
                            for (int i = 0; i < 4; i++)
                            {
                                int byte1 = state[i] & 0xFF000000;
                                int byte2 = state[(i+1) % 4] & 0xFF0000;
                                int byte3 = state[(i+2) % 4] & 0xFF00;
                                int byte4 = state[(i+3) % 4] & 0xFF;

                                kq[i] = byte1 | byte2 | byte3 | byte4;
                            }
                            // stdout.write("\ShiftRows : \n");
                            //     for(int i = 0 ; i < 4; i++){
                            //         stdout.write("\n\t");
                            //         ShowWord(kq[i]);
                            // }
                              return kq;
                      }
                  int Nhan2(int w)  // dịch bit sang trái 1
                      {
                           int kq = w << 1;
                           if(kq > 256) kq = kq ^ 0x11b;  // xor với hàm m
                           kq = kq & 0xFF;  // lấy 1 byte
                           return kq;

                      }
                  int Nhan3( int w)
                      {
                          int kq = w ^ Nhan2(w);  // Xor
                          kq = kq & 0xFF;
                          return kq;
                      }
                  int NhanCot( int w)
                      {
                             int kq;
                             int byte1 = (w >> 24) & 0xFF;
                             int byte2 = (w >> 16) & 0xFF;
                             int byte3 = (w >> 8) & 0xFF;
                             int byte4 = w & 0xFF;
                             int kq1 = Nhan2(byte1) ^ Nhan3(byte2) ^ byte3 ^ byte4;
                             int kq2 = byte1 ^ Nhan2(byte2) ^ Nhan3(byte3) ^ byte4;
                             int kq3 = byte1 ^ byte2 ^ Nhan2(byte3) ^ Nhan3(byte4);
                             int kq4 = Nhan3(byte1) ^ byte2 ^ byte3 ^ Nhan2(byte4);
                              kq = (kq1 << 24) | (kq2 << 16) | (kq3 << 8) | kq4;
                             // stdout.write("\n\t");
                             // ShowWord(kq);
                            return kq;
                      }
                  List<int> MixColumns( List<int> state)
                      {
                        List<int> kq = List.filled(4,0);
                       // stdout.write("\nMixColumn : \n");
                        for (int i = 0; i < 4; i++)
                          kq[i] = NhanCot(state[i]);
                          return kq;
                        }
                  void ShowMatrix(List<int> w)
                      {
                      for (int i = 0; i < 4; i++)
                      {
                        stdout.write("\n\t"); ShowWord(w[i]);
                      }
                      }
                  List<int> MahoaAES(List<int> state, List<int> key)
                      {
                                List<int> w = KeyExpansion(key);
                                List <int> w0 = [w[0],w[1],w[2],w[3]];
                                state = AddRoundKey(state,w0);
                                for(int j = 1; j <= 9; j++)
                                {
                                  List <int> wi = [w[4*j],w[4*j+1],w[4*j+2],w[4*j+3]];
                                  state = SubBytes(state);
                                  state = ShiftRows(state);
                                  state = MixColumns(state);
                                  state = AddRoundKey(state,wi);
                               //   print("\nVòng : $j\n");ShowMatrix(state);

                                }
                                //Vong thu 10
                                //  print("\nVòng : 10\n");
                                  state = SubBytes(state);
                                  state = ShiftRows(state);
                                  List <int> w40 = [w[40],w[41],w[42],w[43]];
                                  state = AddRoundKey(state,w40);
                                  //ShowMatrix(state);
                                  List<int> kq = List.filled(4,0) ;
                                    kq = state;
                                    return kq;
                      }

                  List<int> InvShiftRows(List<int> state)
                      {
                        List<int> kq = List.filled(4,0);
                        for (int i = 0; i < 4; i++)
                        {
                          int byte1 = state[i] & 0xFF000000;
                          int byte2 = state[(i+3) % 4] & 0xFF0000;
                          int byte3 = state[(i+2) % 4] & 0xFF00;
                          int byte4 = state[(i+1) % 4] & 0xFF;

                        kq[i] = byte1 | byte2 | byte3 | byte4;
                        }
                      //  ShowMatrix(state);
                        return kq;
                  }
                  int Nhan9(int w)
                      {
                      int kq = (w << 3) ^ w;
                      if(kq > (256 << 2)) kq = kq ^ (0x11b << 2);  // dich bit
                      if(kq > (256 << 1)) kq = kq ^ (0x11b << 1);
                      if(kq > 256) kq = kq ^ 0x11b;
                      kq = kq & 0xFF;
                      return kq;
                  }
                  int NhanB(int w)
                      {
                     int kq = (w << 3) ^ (w << 1) ^ w;
                     if(kq > (256 << 2)) kq = kq ^ (0x11b << 2);  // dich bit
                     if(kq > (256 << 1)) kq = kq ^ (0x11b << 1);
                     if(kq > 256) kq = kq ^ 0x11b;
                      kq = kq & 0xFF;
                      return kq;
                  }
                  int NhanD(int w)
                      {
                      int kq = (w << 3) ^ (w << 2) ^ w;
                      if(kq >= (256 << 2)) kq = kq ^ (0x11b << 2);  // dich bit
                      if(kq >= (256 << 1)) kq = kq ^ (0x11b << 1);
                      if(kq >= 256) kq = kq ^ 0x11b;
                      kq = kq & 0xFF;
                      return kq;
                  }
                  int NhanE(int w)
                      {
                      int kq = (w << 3) ^ (w << 2) ^ (w << 1);
                      if(kq >= (256 << 2)) kq = kq ^ (0x11b << 2);  // dich bit
                      if(kq >= (256 << 1)) kq = kq ^ (0x11b << 1);
                      if(kq >= 256) kq = kq ^ 0x11b;
                      kq = kq & 0xFF;
                      return kq;
                  }
                  int InvNhanCot(int w)
                      {
                       int kq;
                       int byte1 = (w >> 24) & 0xFF;
                       int byte2 = (w >> 16) & 0xFF;
                       int byte3 = (w >> 8) & 0xFF;
                       int byte4 = w & 0xFF;
                       int kq1 = NhanE(byte1) ^ NhanB(byte2) ^ NhanD(byte3) ^ Nhan9(byte4);
                       int kq2 = Nhan9(byte1) ^ NhanE(byte2) ^ NhanB(byte3) ^ NhanD(byte4);
                       int kq3 = NhanD(byte1) ^ Nhan9(byte2) ^ NhanE(byte3) ^ NhanB(byte4);
                       int kq4 = NhanB(byte1) ^ NhanD(byte2) ^ Nhan9(byte3) ^ NhanE(byte4);
                       kq = (kq1 << 24) | (kq2 << 16) | (kq3 << 8) | kq4;
                       return kq;
                  }
                  List<int> InvMixColumns(List<int> state)
                      {
                    List<int> kq = List.filled(4,0);
                    for (int i = 0; i < 4; i++)
                      kq[i] = InvNhanCot(state[i]);
                    return kq;
                  }

                  List<int>GiaimaAES(List<int> C,List<int> key)
                      {
                      List<int> w = KeyExpansion(key);
                      List<int> w40 = [w[40],w[41],w[42],w[43]];
                      List<int> state = AddRoundKey(C,w40);
                      for(int j = 1; j <=9 ;j++){
                        List <int> wi = [w[40 - (4*j)],w[40 - (4*j)+1],w[40 - (4*j)+2], w[40- 4*j + 3]];
                        state = InvShiftRows(state);
                        state = InvSubBytes(state);
                        state = AddRoundKey(state,wi);
                        state = InvMixColumns(state);
                      }
                      // Vong 10
                      state = InvShiftRows(state);
                      state = InvSubBytes(state);
                      List<int> w3 = [w[0],w[1],w[2],w[3]];
                      state = AddRoundKey(state,w3);
                      return state;
                  }
                  int InvSubWord(int w)
                      {
                      List<int> InvS = [
                      0x52, 0x09, 0x6a, 0xd5, 0x30, 0x36, 0xa5, 0x38, 0xbf, 0x40, 0xa3, 0x9e, 0x81, 0xf3, 0xd7, 0xfb,
                      0x7c, 0xe3, 0x39, 0x82, 0x9b, 0x2f, 0xff, 0x87, 0x34, 0x8e, 0x43, 0x44, 0xc4, 0xde, 0xe9, 0xcb,
                      0x54, 0x7b, 0x94, 0x32, 0xa6, 0xc2, 0x23, 0x3d, 0xee, 0x4c, 0x95, 0x0b, 0x42, 0xfa, 0xc3, 0x4e,
                      0x08, 0x2e, 0xa1, 0x66, 0x28, 0xd9, 0x24, 0xb2, 0x76, 0x5b, 0xa2, 0x49, 0x6d, 0x8b, 0xd1, 0x25,
                      0x72, 0xf8, 0xf6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xd4, 0xa4, 0x5c, 0xcc, 0x5d, 0x65, 0xb6, 0x92,
                      0x6c, 0x70, 0x48, 0x50, 0xfd, 0xed, 0xb9, 0xda, 0x5e, 0x15, 0x46, 0x57, 0xa7, 0x8d, 0x9d, 0x84,
                      0x90, 0xd8, 0xab, 0x00, 0x8c, 0xbc, 0xd3, 0x0a, 0xf7, 0xe4, 0x58, 0x05, 0xb8, 0xb3, 0x45, 0x06,
                      0xd0, 0x2c, 0x1e, 0x8f, 0xca, 0x3f, 0x0f, 0x02, 0xc1, 0xaf, 0xbd, 0x03, 0x01, 0x13, 0x8a, 0x6b,
                      0x3a, 0x91, 0x11, 0x41, 0x4f, 0x67, 0xdc, 0xea, 0x97, 0xf2, 0xcf, 0xce, 0xf0, 0xb4, 0xe6, 0x73,
                      0x96, 0xac, 0x74, 0x22, 0xe7, 0xad, 0x35, 0x85, 0xe2, 0xf9, 0x37, 0xe8, 0x1c, 0x75, 0xdf, 0x6e,
                      0x47, 0xf1, 0x1a, 0x71, 0x1d, 0x29, 0xc5, 0x89, 0x6f, 0xb7, 0x62, 0x0e, 0xaa, 0x18, 0xbe, 0x1b,
                      0xfc, 0x56, 0x3e, 0x4b, 0xc6, 0xd2, 0x79, 0x20, 0x9a, 0xdb, 0xc0, 0xfe, 0x78, 0xcd, 0x5a, 0xf4,
                      0x1f, 0xdd, 0xa8, 0x33, 0x88, 0x07, 0xc7, 0x31, 0xb1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xec, 0x5f,
                      0x60, 0x51, 0x7f, 0xa9, 0x19, 0xb5, 0x4a, 0x0d, 0x2d, 0xe5, 0x7a, 0x9f, 0x93, 0xc9, 0x9c, 0xef,
                      0xa0, 0xe0, 0x3b, 0x4d, 0xae, 0x2a, 0xf5, 0xb0, 0xc8, 0xeb, 0xbb, 0x3c, 0x83, 0x53, 0x99, 0x61,
                      0x17, 0x2b, 0x04, 0x7e, 0xba, 0x77, 0xd6, 0x26, 0xe1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0c, 0x7d
                      ];
                      int kq = 0;
                      for(int i = 1; i <= 4; i++)
                      {
                        int byte1 = (w >> (32 - i * 8)) & 0xFF ;
                        int subB = InvS[byte1];
                        kq = (kq << 8) | subB;
                        }
                        return kq;
                  }
                  List<int> InvSubBytes(List<int> state)
                      {
                        List<int> kq = List.filled(4,0);
                          for (int i = 0; i < 4; i++)
                            kq[i] = InvSubWord(state[i]);
                          return kq;
                      }

void main()
  {

    DateTime time1 = DateTime.now();
    print("---------------------Bắt đầu mã hóa với Khóa mã hóa-----------------------------");
    String TextKey = "dodangghet";
    print("Khóa mã hóa : $TextKey");
    List<int> Key = List.filled(4,0);
    Key = input(TextKey, Key);
    print("---------------------Bắt đầu mã hóa với Planittext-----------------------------");
    String str = "tamxinhdep";
    print("Input String : $str");
    List<int> state = List.filled(4,0);
    state = input(str, state);
    List<int> C = MahoaAES(state,Key);
    print("\nBản mã :");
    ShowMatrix(C);
    print("\n---------------------Bắt đầu giải mã với Decryption Text-----------------------------");
    List<int> D = GiaimaAES(C,Key);
    print("\nGiai ma :");
    ShowMatrix(D);
    stdout.write('\nOutput String : ');
    output(D);
    DateTime time2 = DateTime.now();
    stdout.write("\nTime of Process");
    double a = (time2.millisecond - time1.millisecond) / 1000;
    stdout.write("$a");
    time2.subtract(Duration(seconds: time1.second,));
    // Test_decode

}
List<String> splitStringByLength(String str, int length) {
  int index = 0;
  List<String> data = [];
  while (index < str.length) {
    data.add(
        str.substring(index, index + 4 < str.length ? index + 4 : str.length));
    index = index + length;
  }
  return data;
}

String chuanHoaDuLieu(String str) {
  if (str.length < 16) {
    str = str + '0' * (16 - str.length);
  }
  return str;
}

String convertStringtoHexString(String str) {
  List<int> input = str.codeUnits;
  List<String> hex = [];
  for (int number in input) {
    hex.add(number.toRadixString(16));
  }
  return '0x' + hex.join();
}

List<List<String>> chuyenSangMatrix() {
  return [[]];
}
List<int> input(String input, List<int> state){
  input = chuanHoaDuLieu(input);
  List<String> data = splitStringByLength(input, 4);
  for(int i = 0 ; i < state.length;i++){
    // print(data[i]);
    // print(int.parse(convertStringtoHexString(data[i])).toRadixString(16));
    state[i] = int.parse(convertStringtoHexString(data[i]));
  }
  return state;
}
void output(List<int> D){
  for(int i = 0 ; i < D.length ; i++){
    String hexString = D[i].toRadixString(16);
    List<String> splitted = [];
    for (int i = 0; i < hexString.length; i = i + 2) {
      splitted.add(hexString.substring(i, i + 2));
    }
    String ascii = List.generate(splitted.length,
            (i) => String.fromCharCode(int.parse(splitted[i], radix: 16))).join();
    ascii = ascii.replaceAll('0', '');
    stdout.write('${ascii}');
  }

}