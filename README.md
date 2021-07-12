# Asp.Net-Mvc-Core-Online-Market
## Kodluyoruz Bitirme Projesi

 Proje Asp.Net Mvc Core ile geliştirilmiştir. Projede katmanlı mimari yapısı kullanılmıştır. Business katmanı, DataAccess katmanı, Entities katmanı ve Web katmanı bulunmaktadır.
Proje **Entity Framework Code First** yaklaşımı ile geliştirilmiştir. Üyelik sisteminde **Identity Core** kullanılmıştır. User register'da mail ile doğrulama vardır. Projede hatasız çalışan bir rol sistemi mevcuttur. Ödeme sistemi olarak **Iyzico** kullanılmıştır. Proje Kodluyoruz Backend kursu bitirme projesi olarak yapılmıştır. Aşağıda projeye dair ayrıntılı açıklama ve projeden resimler mevcuttur.

Projede 3 kısım vardır 

1. Front End 
2. User Area 
3. Admin Area

Projede Şu eklentilerde kullanılmıştır.

- Datatables
- SweetAlert
- CKEditör
- Google Chart


## Front End

![ezgif-4-47ffa1a52a0c](https://user-images.githubusercontent.com/65186980/113505818-deea9980-9549-11eb-8462-b81a04769b58.gif)

Front End kısmında şu sayfalar vardır.

- Home
- Products
- About Us
- Contact
- Login
- Register

1. Home

İlk olarak Home sayfasında bir **search** butonu vardır ve buradan ürün aramak mümkündür. Onun altında bir slider vardır. Slider'ın altında Products Of Month ve Today Offers vardır ve buraları Admin Area'dan değiştirebiliyoruz. Onların altında ise Popular Products kısmı vardır ve burayıda Admin Area'dan değiştirebiliriz. Popüler ürünlerden sonra Kategoriler var ve son olarak en altta New Offers kısmı var ve burayıda Admin Area'dan ayarlayabiliriz.

2. Products

Ürünler sayfasında kategoriler ve ürünler vardır. Kategorileri Admin Area'dan değiştirebiliriz. Ürünleri ise detaylarına gidebilir, istek listesine ekleyebilir ve karta ekleyebiliriz. Ürün sayfalarında **paging** mevcuttur. Ayrıca indirimleri ürünlerin görünümleri ve fiyatları değişmektedir.

3. About Us

Bu kısımda kısa bir hakkımızda yazısı ve ileitşim bilgileri vardır.

4. Contact

İletişim kısmında iletişim bilgileri ve bir harita mevcuttur. Leave a message kısmından mesajlar bırakılabilir. Bu mesajlar admin kısmında gözükmekte ve cevaplanabilmektedir.

5. Login

Login kısmından mail doğrulamasını yapan kullanıcılar giriş yapabilir.

6. Register

Kayıt olma kısmında bilgilerinizle kayıt olabilirsiniz. Kayıt olduktan sonra doğrulama maili gelmektedir bunu doğruladıktan sonra giriş yapabilirsiniz.

## User Area

![ezgif-4-81c3ed1bbc1b](https://user-images.githubusercontent.com/65186980/113506369-2292d280-954d-11eb-8c57-6f76e063e5b8.gif)

User'lar şu işlemleri yapabilir.

- Karta eklediği ürünlerin ödemesini yapabilir (**İyzico ile ödeme**).
- Ödemesini yaptığı ürünleri görebilir ve kargo takibi yapabilir.
- İstek listesine eklediği ürünleri görebilir ve istek listesinden çıkarabilir.
- Adreslerini ekleyebilir, güncelleyebilir veya silebilir
- Kart bilgilerini ekleyebilir, günceleyebilir ve silebilir.
- Profilinden kulanıcı bilgilerini değiştirebilir.

## Admin Area

![ezgif-4-897c3b3cae94](https://user-images.githubusercontent.com/65186980/113506640-b618d300-954e-11eb-9ea8-da6ed0fcbb6e.gif)

Admin Area'da şu sayfalar vardır.

- Dashboard
- Categories
- Products
- Roles
- Users
- Orders
- Announcements
- Help Messages
- Go to the site
- Statistic
- Graphics

Admin Area'ya girmek için arama çubuğuna /Admin diyerek gidebilirsiniz ve kullanıcı adı ve şifre ile giriş yapabilirsiniz.

1. Dashboard 

Bu kısımda önemli bir kaç istatistik var ve ana sayfadaki değişebilen kısımları değiştirebilmek için bölümler mevcut.

2. Categories

Burada kategori listesi, güncelleme, ekleme ve soft delete işlemleri var. Buradaki tabloda ve gelecek tablolarda  **DataTables** eklentisi kulanılmıştır. Kategori güncellerken o kategoriye ait bütün ürünler listelenmektedir.

3. Products

Ürünler kısmında; ürün listesi, ekleme, güncelleme ve soft delete işlemi vardır. Ürün eklerken ve güncellerken açıklama kısmında **CKEditör** eklentisi kullanılmışıtr. Ayrıca burada ürün eklerken ve güncellerken Chosse File ile resim ekleyebiliyoruz. Ayrıca ürünlerin indirimli fiyatlarını girersek Front End kısmındaki ürünlerde indirim olduğu belirtilmektedir. Ürün ekleme ve güncellemede indirimli ile ilgili bilgi vermek için **SweetAlert** kullanılmıştır.

4. Roles

Roller kısmında yeni rol ekleyebilir. Mevcut rolerin içine üyeler ekleyebilir ve çıkarabilirsiniz. Sadece 'Admin' rolüne sahip kullanıcılar Admin paneline erişim sağlayabilmektedir. Datatables eklentisi kullanılmıştır.

5. Users

Kullanıcı kısmında sadece kullanıcıların listesi yer almaktadır.

6. Orders

Buradan siparişleri görebilirsiniz. Siparişleri soft delete ile pasif hale getirebilirsiniz. Ayrıca kargo işlemlerinide buradan gerçekleştirebilirsiniz.

7. Announcements

Duyuru kısmıyla kullanıcıların görebileceği duyurular yapabilir ve duyuruları değiştirebilirsiniz.

8. Help Message

Burada Front End kısmında göstermiş olduğum yardım panelinden gelen mesajları görebilir ve cevaplayabilirsiniz.

9. Statistic

Burada 16 adet istatistik bulunmaktadır. Örneğin kaç adet kullanıcımız var. En çok hangi kullanıcımız para harcıyor gibi.

10. Graphics

Burada 3 adet grafik vardır. Pie Chart--Line Chart--Column Chart. Grafiklerde **Google Chart** kullanılmıştır.

## Kurulum

Son olarak nasıl kurulum yapıp kullanabileceğinizden bahsedicem. Kurulum gayet basit ilk olarak Proje'yi Clone alıyoruz ardından Database'i kurmamız gerekiyor. Database için dosyaların içinde bulunan script dosyasını kullanabilir veya Back Up alınmış yedeği kullanabilirsiniz.

*HomePage'deki template w3layouts'tan, Admin paneldeki template ise adminlte'den alınmıştır.*

Proje geliştirmelerine devam etmekteyim herhangi bir öneriniz var ise  veya herhangi bir sorun ile karşılaşırsanız 
Mail: erkilicbedirhan@gmail.com

## Kodluyoruz Mezuniyet Belgesi

![Kodluyoruz Mezuniyet Belgesi](https://user-images.githubusercontent.com/65186980/125355644-f2d64080-e36d-11eb-9558-d55ec5c6e700.png)
