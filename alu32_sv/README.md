# ALU32 SystemVerilog Project

## Mô tả
Dự án này hiện thực một ALU (Arithmetic Logic Unit) 32-bit sử dụng SystemVerilog, bao gồm các phép toán số học và logic cơ bản. Dự án có các file mã nguồn, testbench kiểm thử tự động, và script để biên dịch/chạy mô phỏng.

## Cấu trúc thư mục
- `alu_pkg.sv`: Định nghĩa các loại phép toán (enum) cho ALU.
- `alu32.sv`: Mô tả module ALU 32-bit, thực hiện các phép toán cộng, trừ, and, or, xor, so sánh nhỏ hơn, dịch trái/phải, not.
- `tb_alu32.sv`: Testbench tự động kiểm thử các chức năng của ALU.
- `run.bat`: Script cho Windows để biên dịch và chạy mô phỏng bằng Icarus Verilog.

## Hướng dẫn sử dụng
1. **Yêu cầu:**
   - Đã cài đặt [Icarus Verilog](https://iverilog.fandom.com/wiki/Installation).
2. **Chạy mô phỏng:**
   - Mở terminal/cmd tại thư mục `alu32_sv`.
   - Gõ lệnh: `run.bat`
   - Kết quả sẽ hiển thị trên màn hình, thông báo nếu có lỗi hoặc tất cả test đều pass.

## Thông tin thêm
- Dự án sử dụng chuẩn SystemVerilog 2012 (`-g2012`).
- Có thể mở, chỉnh sửa và mở rộng các phép toán trong `alu_pkg.sv` và `alu32.sv`.
- Testbench có thể mở rộng thêm các trường hợp kiểm thử khác.

## Tác giả
- Trịnh Quang Trung
- Ngày cập nhật: 18/12/2025
