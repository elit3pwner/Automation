# Basic script to filter out potential endpoints

# XSS
echo "Filtering URLs for potential XSS endpoints..."
cat "output.txt" | Gxss | kxss | grep -oP '^URL: \K\S+' | sed 's/=.*/=/' | sort -u > "xss_output.txt"
echo "Extracting final filtered URLs to xss_output.txt..."

# Open Redirect
echo "Filtering URLs for potential Open Redirect endpoints..."
cat "output.txt" | gf or | sed 's/=.*/=/' | sort -u > "open_redirect_output.txt"

# LFI
echo "Filtering URLs for potential LFI endpoints..."
cat "output.txt" | gf lfi | sed 's/=.*/=/' | sort -u > "lfi_output.txt"

# SQLi
echo "Filtering URLs for potential SQLi endpoints..."
cat "output.txt" | gf sqli | sed 's/=.*/=/' | sort -u > "sqli_output.txt"

# Remove the intermediate file output.txt
rm "output.txt"

# Notify the user that all tasks are complete
echo "Filtered URLs have been saved to the respective output files:"
echo "  - XSS: xss_output.txt"
echo "  - Open Redirect: open_redirect_output.txt"
echo "  - LFI: lfi_output.txt"
echo "  - SQLi: sqli_output.txt"