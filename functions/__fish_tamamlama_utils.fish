# Fish Tamamlama - Yardımcı Fonksiyonlar

# ukur: "Uygulama KUR" kelimelerinin kısaltması
function ukur -d "Sistemde eksik olan araçları akıllıca kurar"
    set -l tool_name $argv[1]
    
    if test -z "$tool_name"
        echo (set_color red)"Hata: Lütfen kurulacak bir araç adı belirtin. Örn: ukur rg"(set_color normal)
        return 1
    end

    if command -v $tool_name >/dev/null
        echo (set_color green)"'$tool_name' zaten sistemde kurulu."(set_color normal)
        return 0
    end

    set -l os_type (uname)

    # MacOS için Brew Kontrolü ve Kurulumu
    if test "$os_type" = "Darwin"
        if not command -v brew >/dev/null
            echo (set_color yellow)"Brew (Homebrew) bulunamadı. Kurulmasını ister misiniz? (y/n): "(set_color normal)
            read -l confirm_brew
            if test "$confirm_brew" = "y" -o "$confirm_brew" = "Y"
                echo "Homebrew kuruluyor..."
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
                # Brew yolunu oturuma ekle (Mac M1/M2/Intel farkı için)
                if test -f /opt/homebrew/bin/brew
                    eval (/opt/homebrew/bin/brew shellenv)
                else if test -f /usr/local/bin/brew
                    eval (/usr/local/bin/brew shellenv)
                end
            else
                echo "Brew olmadan kurulum devam edemez."
                return 1
            end
        end
    end

    # Kurulum Stratejisi
    echo (set_color yellow)"'$tool_name' sistemde bulunamadı. Kurulmasını ister misiniz? (y/n): "(set_color normal)
    read -l confirm

    if test "$confirm" = "y" -o "$confirm" = "Y"
        # 1. Rust Araçları Stratejisi (Her iki OS için)
        set -l rust_tools rg mdbook wasm-bindgen rust-analyzer cargo-clippy cargo-fmt
        if contains $tool_name $rust_tools
            if not command -v cargo >/dev/null
                echo "Cargo bulunamadı, önce Rust (rustup) kuruluyor..."
                curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable --profile complete
                source $HOME/.cargo/env
            end
            
            echo "Cargo kullanılarak '$tool_name' kuruluyor..."
            if test "$tool_name" = "rg"
                cargo install ripgrep
            else
                cargo install $tool_name
            end
            return
        end

        # 2. MacOS - Brew Stratejisi
        if test "$os_type" = "Darwin"
            echo "Homebrew kullanılarak '$tool_name' kuruluyor..."
            brew install $tool_name
            return
        end

        # 3. Linux - Bilgilendirme
        if test "$os_type" = "Linux"
            echo (set_color red)"Linux üzerinde şu an için sadece Rust ekosistemi otomatik kurulabilmektedir."(set_color normal)
            echo "Lütfen '$tool_name' aracını paket yöneticinizle (apt, pacman vb.) manuel kurun."
        end
    else
        echo "Kurulum iptal edildi."
    end
end
