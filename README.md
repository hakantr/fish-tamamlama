# Fish Tamamlama Sistemi

Fish shell için gelişmiş komut tamamlama özellikleri ve otomatik araç kurulum yöneticisi.

## Özellikler

- **Gelişmiş Tamamlama (Tab Döngüsü)**: Tab tuşuna bastığınızda seçenekler arasında ok tuşlarına gerek kalmadan gezinebilirsiniz.
- **Hayalet Metin (Otomatik Öneriler)**: Komut yazarken geçmişe dayalı önerileri gri renkte görebilirsiniz.
- **Modüler Yapı**: Her komut (Rust, Cargo, Brew, fdisk vb.) kendi klasöründe (`commands/`) organize edilmiştir.
- **Akıllı Kurulum**: Sistemde bulunmayan bir araç için tamamlama yapmaya çalıştığınızda, sistem bu aracın kurulmasını teklif eder.

## Mevcut Desteklenen Komutlar

| Komut | Kategori | Açıklama |
| :--- | :--- | :--- |
| `rustc` | Rust | Rust Derleyicisi |
| `cargo` | Rust | Rust Paket Yöneticisi |
| `rustup` | Rust | Rust Kurulum Yöneticisi |
| `rustfmt` | Rust | Rust Kod Formatlayıcı |
| `rustdoc` | Rust | Rust Dökümantasyon Üretici |
| `cargo-fmt` | Rust | Cargo Format Eklentisi |
| `cargo-clippy` | Rust | Cargo Linter Eklentisi |
| `cargo-miri` | Rust | Cargo Miri Eklentisi |
| `clippy-driver` | Rust | Clippy Sürücüsü |
| `rust-analyzer` | Rust | Rust Dil Sunucusu (LSP) |
| `mdbook` | Araç | Markdown Kitap Oluşturucu |
| `rg` | Araç | Ripgrep - Hızlı Arama Aracı |
| `wasm-bindgen` | WebAssembly | JS/Rust Bağlantı Aracı |

## Kurulum

Bu depoyu klonlayın ve `init.fish` dosyasını kaynak (source) olarak ekleyin:

```fish
git clone git@github.com:KULLANICI_ADI/fish-tamamlama.git
cd fish-tamamlama
source init.fish
```

Kalıcı hale getirmek için `~/.config/fish/config.fish` dosyanıza şu satırı ekleyebilirsiniz:

```fish
source /dosya/yolu/fish-tamamlama/init.fish
```

## Yeni Komut Ekleme

Yeni bir komut eklemek için `commands/` dizini altında komut adıyla bir klasör oluşturun:
1. `commands/komut_adi/completions/komut_adi.fish` dosyasını oluşturun.
2. Varsa fonksiyonlarınızı `commands/komut_adi/functions/` dizinine ekleyin.
3. `init.fish` dosyasını tekrar çalıştırın.

## Lisans

MIT
