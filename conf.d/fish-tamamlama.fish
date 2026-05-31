# Fish Tamamlama - Fisher Başlatıcı (conf.d/fish-tamamlama.fish)

# 1. Görsel ve Davranış Ayarları
set -g fish_color_autosuggestion 555 br-black
bind \t complete
bind -M completion \t down-or-search
bind -M completion \e\[Z up-or-search

# 2. Tamamlamaları Zorunlu Yükle (Fisher yolları ekler ama biz çakışmaları temizleyip yeniden yüklüyoruz)
set -l tools cargo cargo-clippy cargo-fmt cargo-miri clippy-driver mdbook rg rust-analyzer rustc rustdoc rustfmt rustup wasm-bindgen

for tool in $tools
    complete -e $tool
end

# Fisher tarafından completions dizini zaten yola eklendi, 
# ancak mevcut oturumda hemen aktif olması için dosyaları source edelim
for f in (dirname (status filename))/../completions/*.fish
    if test -s $f
        source $f
    end
end
