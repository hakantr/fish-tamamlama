# Fish Tamamlama Sistemi

Fish shell için gelişmiş komut tamamlama özellikleri ve akıllı araç kurulum yöneticisi.

## Özellikler

- **Gelişmiş Tamamlama (Tab Döngüsü)**: Tab tuşuna bastığınızda seçenekler arasında ok tuşlarına gerek kalmadan gezinebilirsiniz.
- **Hayalet Metin (Otomatik Öneriler)**: Komut yazarken geçmişe dayalı önerileri gri renkte görebilirsiniz.
- **Akıllı Kurulum (`ukur`)**: Sistemde bulunmayan araçları tek bir komutla kurabilirsiniz (Cargo ve Brew desteği).

## Kurulum (Fisher ile)

En kolay yöntem [Fisher](https://github.com/jorgebucaran/fisher) paket yöneticisini kullanmaktır:

```fish
fisher install hakantr/fish-tamamlama
```

Bu komutla tüm tamamlamalar ve `ukur` fonksiyonu otomatik olarak yüklenecek ve her terminal açılışında aktif olacaktır.

## Manuel Kurulum

Eğer Fisher kullanmıyorsanız:

```fish
git clone git@github.com:hakantr/fish-tamamlama.git
cd fish-tamamlama
source init.fish
```

## Kullanım: `ukur` Komutu

Eksik bir aracı kurmak için:

```fish
ukur rg    # crates.io üzerinden kurar
ukur gh    # macOS üzerinde brew ile kurar
```

## Lisans

MIT
