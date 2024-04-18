#import "template.typ": *

#show: project.with(
  title: "Các phương pháp phục chế màu cho ảnh độ xám",
  authors: (
    "Nguyễn Trần Minh Quang - 20127298",
  ),
)

= Các phương pháp phổ biến
Có rất nhiều công trình nghiên cứu liên quan đến việc phục chế ảnh độ sáng trong đó hầu hết các phương pháp đều dựa trên các phương pháp chính như là:
- Sử dụng phương pháp color mapping / gradient mapping trên độ xám
- Sử dụng một mô hình máy học

= Khôi phục màu bằng phương pháp color mapping
== Nguyên lý hoạt động
Khi chuyển ảnh độ xám thành ảnh màu, một trong số phương pháp đơn giản nhất đó là sử dụng phương pháp color mapping.

Phương pháp này coi một phân vùng nào đó sẽ thiên theo một dải màu nhất định và sẽ áp các công thức để ước lượng 3 kênh R, G, B theo độ sáng tại điểm ảnh đó.

#figure(
  image("images/colormaps.png"),
  caption: "So sánh một số dải màu phổ biến."
) <colormaps>

Phương pháp này tốt khi muốn áp dụng cùng với lập trình shader, vì nó chỉ quan tâm đến theo một điểm ảnh mà không cần quan tâm các thông tin khác ở xung quanh.

== Hạn chế
Tuy nhiên ở thực tế toàn bộ bức ảnh không chỉ thiên theo một dải màu nhỏ đó. Nếu áp colormapping cho cả một bức ảnh thường sẽ cho ra kết quả khác xa so với thực tế.

#figure(
  image("images/single_colormapping.png"),
  caption: "Áp dụng duy nhất một phương pháp colormapping."
) <single_colormapping>

== Các cải tiến về phương pháp
Phương pháp này có thể được cải tiến bằng cách tách một bức ảnh ra nhiều phân vùng, và mỗi phân vùng này lựa dải màu thích hợp để đưa ra kết quả gần với thực nhất.

#figure(
  image("images/colormapping_segmentation.png"),
  caption: "Chia nhiều phân vùng và colormapping."
) <colormapping_segmentation>

Việc phân vùng có thể được lựa chọn bằng tay hoặc thông qua các mô hình học máy để xác định.

#bibliography(
  "reference.yml",
  title: "Trích dẫn",
  full: true
)