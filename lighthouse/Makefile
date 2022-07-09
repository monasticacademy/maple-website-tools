
OUT := reports/$(shell date "+%Y-%m-%d_%H-%M-%S")

default: create-report

create-report:
	mkdir -p $(OUT)
	lighthouse https://www.monasticacademy.com \
		--preset=desktop \
		--output=html,json \
		--output-path=$(OUT)/homepage \
		--chrome-flags="--headless"
	rm -f latest
	ln -s $(OUT) latest


setup:
	npm install -g lighthouse
