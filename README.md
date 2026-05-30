# Fish Tamamlama Sistemi

Fish shell için gelişmiş komut tamamlama özellikleri ve akıllı araç kurulum yöneticisi.

## Özellikler

- **Gelişmiş Tamamlama (Tab Döngüsü)**: Tab tuşuna bastığınızda seçenekler arasında ok tuşlarına gerek kalmadan gezinebilirsiniz.
- **Hayalet Metin (Otomatik Öneriler)**: Komut yazarken geçmişe dayalı önerileri gri renkte görebilirsiniz.
- **Modüler Yapı**: Her komut kendi klasöründe (`commands/`) organize edilmiştir.
- **Akıllı Kurulum (`ukur`)**: Sistemde bulunmayan araçları tek bir komutla kurabilirsiniz.

## İşletim Sistemi ve Kurulum Desteği

| İşletim Sistemi | Rust Ekosistemi | Brew (Homebrew) | Açıklama |
| :--- | :---: | :---: | :--- |
| **macOS** | ✅ Tam Destek | ✅ Tam Destek | `ukur` komutu hem Rust hem Brew üzerinden kurulum yapabilir. |
| **Linux** | ✅ Tam Destek | ❌ Destek Yok | `ukur` komutu şu an için sadece Rust araçlarını otomatik kurar. |

## Kurulum

Bu depoyu klonlayın ve `init.fish` dosyasını kaynak (source) olarak ekleyin:

```fish
git clone git@github.com:hakantr/fish-tamamlama.git
cd fish-tamamlama
source init.fish
```

## Kullanım: `ukur` Komutu

Sistemde yüklü olmayan bir aracı kurmak için `ukur` komutunu kullanın:

```fish
ukur rg        # Linux/macOS üzerinde ripgrep kurar
ukur mdbook    # Markdown kitap oluşturucu kurar
ukur gh        # macOS üzerinde brew ile GitHub CLI kurar
```

**Not:** macOS üzerinde `brew` kurulu değilse, `ukur` komutu önce Brew kurulumunu yapmayı teklif edecektir.

## Mevcut Tamamlama Desteği Sunulan Komutlar

| Komut | Kategori | Açıklama |
| :--- | :--- | :--- |
| `rustc` / `cargo` | Rust | Temel Rust Araçları |
| `rustup` | Rust | Kurulum Yöneticisi |
| `rg` | Araç | Ripgrep Arama |
| `mdbook` | Araç | Markdown Kitap |
| ...ve daha fazlası | - | - |

## Lisans

MIT
