code_settings=$HOME/.config/'Code - OSS'/User/settings.json
sed -i /.*workbench.colorTheme.*/c\\"\t\"workbench.colorTheme\": \"$1\"," "$code_settings"

if [[ "$3" == "dark" ]]; then
    sed -i /.*everforest.darkContrast.*/c\\"\t\"everforest.darkContrast\": \"hard\"," "$code_settings"
    sed -i /.*gruvboxMaterial.darkContrast.*/c\\"\t\"gruvboxMaterial.darkContrast\": \"hard\"," "$code_settings"
else
    sed -i /.*everforest.darkContrast.*/c\\"\t\"everforest.darkContrast\": \"medium\"," "$code_settings"
    sed -i /.*gruvboxMaterial.darkContrast.*/c\\"\t\"gruvboxMaterial.darkContrast\": \"medium\"," "$code_settings"
fi