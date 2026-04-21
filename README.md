#  Basic Stack Navigation - Flutter

##  وصف المشروع
تطبيق بسيط يوضح كيفية عمل الـ Stack في Flutter Navigation باستخدام `Navigator.push()` و `Navigator.pop()`.

##  صور المخرجات

| HomeScreen | DetailScreen | عرض حالة المكدس |
|------------|--------------|-----------------|
| ![Home Screen](screenshots/home_screen.png) | ![Detail Screen](screenshots/detail_screen.png) | ![Stack Dialog](screenshots/stack_dialog.png) |

##  المتطلبات المحققة

-  شاشة رئيسية (HomeScreen)
-  شاشة تفاصيل (DetailScreen)
-  زر على كل شاشة للتنقل
-  استخدام `Navigator.push()` للانتقال
-  استخدام `Navigator.pop()` للرجوع
-  زر "عرض حالة المكدس" يوضح ترتيب الشاشات

##  شرح تغير المكدس

| العملية | حالة المكدس |
|---------|-------------|
| بداية التطبيق | `[HomeScreen]` |
| الضغط على زر "الانتقال إلى التفاصيل" | `[HomeScreen, DetailScreen]` |
| الضغط على زر "الرجوع (pop)" | `[HomeScreen]` |
