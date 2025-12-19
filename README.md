# ALU32 SystemVerilog Project

## Giới thiệu
Dự án này xây dựng một ALU (Arithmetic Logic Unit) 32-bit bằng SystemVerilog, hỗ trợ các phép toán số học và logic cơ bản. Bộ mã nguồn gồm module ALU, testbench kiểm thử tự động, và script biên dịch/chạy mô phỏng.

## Thành phần dự án
- **alu_pkg.sv**: Định nghĩa kiểu dữ liệu và các phép toán cho ALU (enum).
- **alu32.sv**: Mô tả chi tiết module ALU 32-bit, thực hiện các phép toán cộng, trừ, and, or, xor, so sánh nhỏ hơn, dịch trái/phải, not.
- **tb_alu32.sv**: Testbench tự động kiểm thử các chức năng của ALU, đảm bảo kết quả chính xác.
- **run.bat**: Script dành cho Windows, dùng để biên dịch và chạy mô phỏng với Icarus Verilog.

## Hướng dẫn sử dụng
1. **Yêu cầu hệ thống**:
   - Đã cài đặt [Icarus Verilog](https://iverilog.fandom.com/wiki/Installation).
2. **Chạy mô phỏng**:
   - Mở terminal/cmd tại thư mục `alu32_sv`.
   - Chạy lệnh: `run.bat`
   - Kết quả sẽ hiển thị trên màn hình, thông báo lỗi hoặc xác nhận các test đã pass.

## Script run.bat
`run.bat` là script dành cho Windows giúp tự động hóa quá trình biên dịch và mô phỏng ALU bằng Icarus Verilog. Các bước thực hiện:

1. **Biên dịch mã nguồn:**
   - Sử dụng lệnh `iverilog -g2012 -o sim.out alu_pkg.sv alu32.sv tb_alu32.sv` để biên dịch toàn bộ các file SystemVerilog thành file thực thi mô phỏng `sim.out`.
   - Nếu quá trình biên dịch gặp lỗi, script sẽ thông báo "Compile FAILED!" và dừng lại.

2. **Chạy mô phỏng:**
   - Nếu biên dịch thành công, script tiếp tục chạy mô phỏng với lệnh `vvp sim.out`.
   - Kết quả kiểm thử từ testbench sẽ được hiển thị trực tiếp trên terminal/cmd.

3. **Kết thúc:**
   - Script sẽ thông báo "Done." và chờ người dùng nhấn phím bất kỳ để kết thúc.

**Lưu ý:**
- Script chỉ chạy trên Windows và yêu cầu đã cài đặt Icarus Verilog (có sẵn lệnh `iverilog` và `vvp`).
- Nếu muốn chạy trên Linux/Mac, cần chuyển đổi sang shell script tương ứng.

## Mở rộng & chỉnh sửa
- Có thể bổ sung thêm phép toán mới trong `alu_pkg.sv` và hiện thực trong `alu32.sv`.
- Testbench (`tb_alu32.sv`) dễ dàng mở rộng thêm các trường hợp kiểm thử khác.
- Dự án sử dụng chuẩn SystemVerilog 2012 (`-g2012`).

## Tác giả & liên hệ
- Trịnh Quang Trung
- NguMinh
- Ngày cập nhật: 19/12/2025

### Tính năng tương tác trong run.bat
- `set /p OUTNAME=Enter output executable name (without .out):` bước này yêu cầu bạn nhập tên file đầu ra và script tự động thêm phần mở rộng `.out`. Nếu bỏ trống, script dừng lại và nhắc lại để tránh sinh file vô danh.
- `choice /C YN /M "Do you want to generate VCD waveform?"` cho phép lựa chọn có/không trước khi chạy `vvp`. Lựa chọn `Y` đưa luồng chạy sang nhánh `RUN_VCD` (sử dụng logic ghi sóng tại testbench), còn `N` giữ luồng chạy nhánh `RUN_NO_VCD` khi không muốn tạo file VCD.

<img width="1920" height="1032" alt="image" src="https://github.com/user-attachments/assets/a17260ae-10b6-46f1-a3ef-992a5fafadd7" />
