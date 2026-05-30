# Fish Tamamlama - Modüler Yükleyici (init.fish)

# 1. Görsel ve Davranış Ayarları
# Hayalet metin rengini ayarla (gri)
set -g fish_color_autosuggestion 555 br-black

# Tab tuşu davranışı: İlk basışta tamamlama menüsünü aç, menü açıkken Tab ile sonraki öğeye geç
bind \t complete
bind -M completion \t down-or-search
bind -M completion [backtab] up-or-search

# 2. Yardımcı Fonksiyonları Yükle (Kurulum desteği için)
set -l current_dir (realpath (dirname (status filename)))
source $current_dir/functions/__fish_tamamlama_utils.fish

# 3. Kritik Araçların Varlığını Kontrol Et ve Kurulum Teklif Et
# Rustup ve Cargo kontrolü
__fish_tamamlama_check_and_install rustup rustup

# Diğer araçların kontrolü (Cargo ile kurulabilenler)
set -l cargo_tools rg mdbook wasm-bindgen rust-analyzer
for tool in $cargo_tools
    __fish_tamamlama_check_and_install $tool cargo
end

# 4. Modüler Tamamlamaları Yükle
set -l commands_dir "$current_dir/commands"

# Tanımlı tüm araçların listesi (Temizlik için)
set -l all_tools cargo cargo-clippy cargo-fmt cargo-miri clippy-driver mdbook rg rust-analyzer rustc rustdoc rustfmt rustup wasm-bindgen

# Eski tanımlamaları temizle
for tool in $all_tools
    complete -e $tool
end

if test -d $commands_dir
    # Önce yolları ekle (Path Injection)
    for cmd_dir in $commands_dir/*
        if test -d $cmd_dir/completions
            if not contains $cmd_dir/completions $fish_complete_path
                set -gp fish_complete_path $cmd_dir/completions
            end
        end
        if test -d $cmd_dir/functions
            if not contains $cmd_dir/functions $fish_function_path
                set -gp fish_function_path $cmd_dir/functions
            end
        end
    end

    # Sonra dosyaları yükle (Zorunlu yükleme)
    for cmd_dir in $commands_dir/*
        if test -d $cmd_dir/completions
            for f in $cmd_dir/completions/*.fish
                if test -s $f
                    source $f
                end
            end
        end
    end
end

echo "Fish tamamlama sistemi aktif edildi. Toplam (count $all_tools) araç denetlendi."
