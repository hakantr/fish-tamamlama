# Fish Tamamlama - Yardımcı Fonksiyonlar

# ukur: "Uygulama KUR" kelimelerinin kısaltması
function ukur -d "Sistemde eksik olan araçları crates.io ve Homebrew üzerinden dinamik olarak arayıp kurar"
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
            echo (set_color yellow)"Brew (Homebrew) bulunamadı."(set_color normal)
            echo -n "Brew kurulmasını ister misiniz? (E/H): "
            read -l confirm_brew
            if string match -qi "e*" "$confirm_brew"
                echo "Homebrew kuruluyor..."
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
                if test -f /opt/homebrew/bin/brew
                    eval (/opt/homebrew/bin/brew shellenv)
                else if test -f /usr/local/bin/brew
                    eval (/usr/local/bin/brew shellenv)
                end
            else
                echo "Brew kurulumu reddedildi."
            end
        end
    end

    # 1. Cargo (crates.io) üzerinde ara
    echo (set_color cyan)"crates.io üzerinde '$tool_name' aranıyor..."(set_color normal)
    if command -v cargo >/dev/null
        # Tam eşleşme kontrolü (crates.io'da paket adının başlangıcı ile eşleşmeli)
        set -l cargo_match (cargo search $tool_name --limit 1 | grep -iE "^$tool_name\s*=")
        if test -n "$cargo_match"
            echo (set_color green)"crates.io üzerinde bulundu: $cargo_match"(set_color normal)
            echo -n "Cargo ile kurulsun mu? (E/H): "
            read -l confirm_cargo
            if string match -qi "e*" "$confirm_cargo"
                echo "Cargo ile kuruluyor..."
                # rg örneği için özel durum (ripgrep)
                if test "$tool_name" = "rg"
                    cargo install ripgrep
                else
                    cargo install $tool_name
                end
                return
            end
        end
    else
        echo (set_color yellow)"Bilgi: Cargo kurulu olmadığı için crates.io araması atlandı."(set_color normal)
    end

    # 2. Homebrew üzerinde ara (Sadece macOS veya Linux'ta brew yüklüyse)
    if command -v brew >/dev/null
        echo (set_color cyan)"Homebrew üzerinde '$tool_name' aranıyor..."(set_color normal)
        if brew info $tool_name >/dev/null 2>&1
            echo (set_color green)"Homebrew üzerinde bulundu."(set_color normal)
            echo -n "Brew ile kurulsun mu? (E/H): "
            read -l confirm_brew_inst
            if string match -qi "e*" "$confirm_brew_inst"
                echo "Homebrew ile kuruluyor..."
                brew install $tool_name
                return
            end
        end
    end

    # 3. Sonuç bulunamadıysa
    echo (set_color red)"Hata: '$tool_name' ne crates.io (Cargo) ne de Homebrew üzerinde bulunamadı."(set_color normal)
    echo "Şu an için sadece Rust ve Brew ekosistemleri desteklenmektedir."
end
