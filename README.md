# Fatura Takip Sistemi

Fatura Takip Sistemi, küçük ve orta ölçekli işletmelerin abonelik, fatura ve kullanıcı yönetimini kolayca yapabilmesi için geliştirilmiş modern bir Ruby on Rails uygulamasıdır.

## Özellikler
- Kullanıcı, abonelik ve fatura yönetimi
- Modern ve responsive arayüz (Bootstrap 5, Chart.js)
- Gelişmiş dashboard ve grafikler
- Türkçe dil desteği
- Yetkilendirme ve erişim kontrolleri

## Kurulum
1. Depoyu klonlayın:
	```sh
	git clone https://github.com/kullaniciadi/faturatakip.git
	cd faturatakip
	```
2. Bağımlılıkları yükleyin:
	```sh
	bundle install
	yarn install # veya npm install
	```
3. Veritabanını oluşturun ve örnek verileri yükleyin:
	```sh
	rails db:setup
	rails db:seed
	```
4. Sunucuyu başlatın:
	```sh
	rails server
	```

## Giriş Bilgileri (Demo)
- Yönetici:  
  E-posta: admin@example.com  
  Şifre: password
- Kullanıcı:  
  E-posta: ali@example.com  
  Şifre: password

## Kısa Notlar
- Demo ortamında örnek abonelik ve fatura verileri otomatik olarak yüklenir.
- Uygulama, Rails 8 ve PostgreSQL ile geliştirilmiştir.
- Modern ve sade bir arayüz sunar.

---
Sorularınız için iletişime geçebilirsiniz.
