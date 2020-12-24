# Hardware: 
**Cần sử dụng điện thoại android**

**Yêu cầu hệ thống**

	Dung lượng đĩa: 1.32 GB (không bao gồm không gian đĩa cho IDE).

# Software:

## Cài đặt Android Studio 

 	Vào link này ![Cài đặt Android Studio](https://flutter.dev/docs/get-started/install/windows#android-setup) để cài Android Studio.

## Cài đặt Flutter SDK và Dart SDK

 	Sau khi cài xong Android Studio, chúng ta cần cài đặt flutter sdk và dart sdk.
	  
**Yêu cầu hệ thống**
	  
Để cài đặt và chạy Flutter, môi trường phát triển của bạn phải đáp ứng các yêu cầu tối thiểu sau:

  	  
1.Hệ điều hành: Windows 7 SP1 or later (64-bit), x86-64 based.
	  
2.Công cụ: Flutter phụ thuộc vào các công cụ này có sẵn trong môi trường của bạn:
	  
	- Windows PowerShell 5.0 or newer (this is pre-installed with Windows 10).
	  
	- Git for Windows 2.x, with the Use Git from the Windows Command Prompt option.

**Cài đặt Flutter SDK và Dart SDK**

	- Vào link này để cài đặt và cấu hình cho Flutter SDK: ![Cài đặt Flutter SDK](https://flutter.dev/docs/get-started/install/windows#get-the-flutter-sdk).

	- Vào đây để install Flutter and Dart Plugins: ![install Flutter and Dart Plugins](https://flutter.dev/docs/get-started/editor).

	=> Sau đó vào Open để mở app config và build.

==Nhưng để chạy được project thì chúng ta cần đăng ký thêm database firebase cho app==

# Database:

Database đã được public 
trên server https://tkxdpm-server.herokuapp.com/swagger/index.html

# Cài đặt server

Tải và cài đặt rider tại:
https://www.jetbrains.com/rider/

Tải và cài đặt dotnet core 3.1 sdk tại:
https://dotnet.microsoft.com/download/dotnet-core/3.1

Tải và cài đặt postgresql tại:
https://www.postgresql.org/download/

Config **DefaultConnection** của database ở file **appsettings.Development.json**.

Mở thư mục project **ecobike_rental_server** bằng Rider. Chọn project **TKXDPM_API** và build cho server. Chọn Project **TKXDPM_TEST** và run các test.



