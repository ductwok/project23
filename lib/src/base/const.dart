import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff103E5B);

const k16BoldStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryColor,
);

const k14Style = TextStyle(fontSize: 14.0, color: kPrimaryColor);

const kInputDecoration = InputDecoration(
  labelText: '',
  labelStyle: TextStyle(fontSize: 14.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(16.0),
    ),
  ),
);

const k24H = 'http://24h.com.vn/upload/rss/trangchu24h.rss';
const kVietNameNet = 'http://vietnamnet.vn/rss/home.rss';
const kDantri = 'http://dantri.com.vn/trangchu.rss';

const urlTrangChu = "https://vnexpress.net/rss/tin-moi-nhat.rss";
const urlCongDong = "https://vnexpress.net/rss/cong-dong.rss";
const urlCuoi = "https://vnexpress.net/rss/cuoi.rss";
const urlDuLich = "https://vnexpress.net/rss/du-lich.rss";
const urlGiaDinh = "https://vnexpress.net/rss/gia-dinh.rss";
const urlGiaiTri = "https://vnexpress.net/rss/giai-tri.rss";
const urlGiaoDuc = "https://vnexpress.net/rss/giao-duc.rss";
const urlKhoaHoc = "https://vnexpress.net/rss/khoa-hoc.rss";
const urlKinhDoanh = "https://vnexpress.net/rss/kinh-doanh.rss";
const urlPhapLuat = "https://vnexpress.net/rss/phap-luat.rss";
const urlTheGioi = "https://vnexpress.net/rss/the-gioi.rss";
const urlThoiSu = "https://vnexpress.net/rss/thoi-su.rss";
const urlSoHoa = "https://vnexpress.net/rss/so-hoa.rss";
const urlStartUp = "https://vnexpress.net/rss/startup.rss";
const urlSucKhoe = "https://vnexpress.net/rss/suc-khoe.rss";
const urlTamSu = "https://vnexpress.net/rss/tam-su.rss";
const urlTheThao = "https://vnexpress.net/rss/the-thao.rss";
const urlXe = "https://vnexpress.net/rss/oto-xe-may.rss";

const kVnExpress = {
  'Trang Chủ': urlTrangChu,
  'Cộng Đồng': urlCongDong,
  'Giải Trí': urlGiaiTri,
  'Thời Sự': urlThoiSu,
  'Giáo Dục': urlGiaoDuc,
  'Du Lịch': urlDuLich,
  'Khoa Học': urlKhoaHoc,
  'Gia Đình': urlGiaDinh,
  'Kinh Doanh': urlKinhDoanh,
  'Pháp Luật': urlPhapLuat,
  'Số Hóa': urlSoHoa,
  'Startup': urlStartUp,
  'Sức Khỏe': urlSucKhoe,
  'Tâm Sự': urlTamSu,
  'Thế Giới': urlTheGioi,
  'Thể Thao': urlTheThao,
  'Xe': urlXe,
  'Cười': urlCuoi,
};
