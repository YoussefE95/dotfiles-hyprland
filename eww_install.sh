cd ~/Downloads
git clone https://github.com/elkowar/eww
cd eww
cargo build --release --no-default-features --features=wayland
cd target/release
chmod +x ./eww
./eww daemon
sudo cp ./eww /usr/local/bin/
