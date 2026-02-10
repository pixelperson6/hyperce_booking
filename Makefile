# Required softwares in for this project 
# Flutter, Dart, Pub, Android Studio, Xcode
# Fvm ,

# flutter command shortcuts
run-dev:
	flutter run -t lib/main_dev.dart --flavor=dev
.PHONY: run-dev

run-stg:
	flutter run -t lib/main_stg.dart --flavor=stg
.PHONY: run-stg

run-prod:
	flutter run -t lib/main_prod.dart --flavor=prod
.PHONY: run-prod

run-dev-chrome:
	flutter run -t lib/main_dev.dart -d chrome --flavor=dev
.PHONY: run-dev-chrome

clean:
	flutter clean
.PHONY: clean

install:
	flutter pub get
.PHONY: install

update:
	flutter pub upgrade
.PHONY: update

version:
	flutter --version
.PHONY: version

build-apk-dev:
	flutter build apk -t lib/main_dev.dart --flavor dev
.PHONY: build-apk-dev

build-apk-stg:
	flutter build apk -t lib/main_stg.dart --flavor stg
.PHONY: build-apk-stg

build-apk-prod:
	flutter build apk -t lib/main_prod.dart --flavor prod
.PHONY: build-apk-prod


add_basic_dependencies:
	flutter pub add easy_localization \
go_router \
flutter_bloc \
responsive_builder \
connectivity_plus \
cached_network_image \
flutter_svg \
hive_flutter \
dartz \
google_fonts \
get_it \
dio \
equatable \
intl \
dropdown_search \
url_launcher \
logarte
.PHONY: add_basic_dependencies

add_dev_dependencies:
	flutter pub add --dev icons_launcher \
flutter_native_splash \
package_rename 
.PHONY: add_dev_dependencies


add_both_dependencies:
	$(MAKE) add_basic_dependencies
	$(MAKE) add_dev_dependencies
.PHONY: add_both_dependencies


flavor_icons:
	for flavor in dev stg prod; do \
		dart run icons_launcher:create --flavor $$flavor; \
	done
.PHONY: flavor_icons


flavor_splash:
	for flavor in dev stg prod; do \
		dart run flutter_native_splash:create --flavor $$flavor; \
	done
.PHONY: flavor_splash