# animation_demo

Thử làm animation sóng biển chuyển động và chuyển đổi giữa ngày/đêm với Flutter

## Ý tưởng:
### Làm animation sóng biển
- Bước 1: Vẽ các hình sóng ở trạng thái tĩnh, sử dụng các tham số đặc trưng của sóng là: biên độ, bước sóng, pha ban đầu. Sau đó sử dụng công thức để tính toạ độ của mỗi điểm. (dùng CustomClipper để vẽ)
- Bước 2: Thêm chuyển động bằng cách thay đổi các tham số: biên độ và pha ban đầu. (sd AnimationController)
- Bước 3: Sắp xếp các lớp sóng chèn lên nhau với Stack.
### Làm animation ngày và đêm
- Bước 1: Làm hiệu ứng chuyển giữa ngày và đêm bằng cách làm trong suốt nền. (sd AnimationController)
- Bước 2: Vẽ mặt trời với mặt trăng nằm đối diện nhau, sử dụng các tham số vị trí là: bán kính và góc để suy ra vị trí theo công thức lượng giác. (dùng CustomPainter để vẽ). Gán hình mặt trăng với mặt vời vào các điểm đã xác định vị trí.
- Bước 3: Làm chuyển động tròn giữa mặt trăng và mặt trời bằng cách thay đổi góc. (sd AnimationController)
- Bước 4: Kết hợp 2 hiệu ứng chuyển nền ngày-đêm và mặt trăng-mặt trời với:

    Thời gian hiệu ứng ngày-đêm = 1/2 * Thời gian hiệu ứng mặt trăng-mặt trời
    
    2 hiệu ứng này đặt chồng lớp lên nhau sd Stack.
### Kết hợp 2 phần animation sóng biển và animation ngày-đêm
- Bước 1: Xếp chồng lớp lên nhau với Stack
- Bước 2: Thêm nút chuyển cảnh giữa ngày và đêm. 
- Bước 3: Sử dụng riverpod để quản lý trạng thái ngày-đêm và trạng thái dừng của animation.

## Kết quả sau khi chạy chương trình:




