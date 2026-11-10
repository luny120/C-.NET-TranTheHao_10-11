namespace ProjectTask.DTO;
public class Project { public int MaDuAn {get;set;} public string TenDuAn {get;set;}=""; public DateTime? NgayBatDau {get;set;} public DateTime? NgayKetThuc {get;set;} public string TrangThai {get;set;}="Đang chạy"; }
public class Member { public int MaThanhVien {get;set;} public string HoTen {get;set;}=""; public string Email {get;set;}=""; public string ChuyenMon {get;set;}=""; }
public class TaskItem { public int MaTask {get;set;} public int MaDuAn {get;set;} public string TenTask {get;set;}=""; public string MoTa {get;set;}=""; public DateTime? HanNop {get;set;} public string DoUuTien {get;set;}="Trung bình"; public string TrangThai {get;set;}="To Do"; public string TenDuAn {get;set;}=""; public string ThanhVien {get;set;}=""; }
public class CompletionStat { public string ThanhVien {get;set;}=""; public int TongTask {get;set;} public int TaskDone {get;set;} public decimal TyLeHoanThanh {get;set;} }
