# Fish Tamamlama - Yardımcı Fonksiyonlar

function __fish_tamamlama_check_and_install
    set -l tool_name $argv[1]
    set -l install_method $argv[2] # 'rustup' or 'cargo'

    if not command -v $tool_name >/dev/null
        echo (set_color yellow)"Uyarı: '$tool_name' sistemde bulunamadı."(set_color normal)
        echo -n "Kurmak ister misiniz? (y/n): "
        read -l confirm

        if test "$confirm" = "y" -o "$confirm" = "Y"
            if test "$install_method" = "rustup"
                echo "Rustup üzerinden 'stable complete' kuruluyor..."
                curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable --profile complete
                source $HOME/.cargo/env
            else if test "$install_method" = "cargo"
                # Önce cargo var mı bak, yoksa onu kurmayı teklif et (recursive)
                if not command -v cargo >/dev/null
                    echo "Cargo bulunamadı, önce Rust kurulumu gerekiyor."
                    __fish_tamamlama_check_and_install cargo rustup
                end
                
                # Cargo artık olmalı
                if command -v cargo >/dev/null
                    echo "Cargo kullanılarak '$tool_name' kuruluyor..."
                    cargo install $tool_name
                else
                    echo "Hata: Cargo kurulamadığı için '$tool_name' kurulamıyor."
                    return 1
                end
            end
        else
            echo "'$tool_name' kurulmadı, tamamlamalar sınırlı olabilir."
        end
    end
end
