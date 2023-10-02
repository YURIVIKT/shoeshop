[![Build Status](https://travis-ci.com/maxbarsukov/shoeshop.svg?branch=master)](https://travis-ci.com/maxbarsukov/shoeshop)
[![Coverage Status](https://coveralls.io/repos/github/maxbarsukov/shoeshop/badge.svg?branch=master)](https://coveralls.io/github/maxbarsukov/shoeshop?branch=master)
[![Security](https://hakiri.io/github/maxbarsukov/shoeshop/master.svg)](https://hakiri.io/github/maxbarsukov/shoeshop/master)
[![GuardRails badge](https://api.guardrails.io/v2/badges/maxbarsukov/shoeshop.svg?token=3d5892fecca01ce92b8bbc383010c005ccba7ec101cd480c093c8bcfb9b131cf&provider=github)](https://dashboard.guardrails.io/gh/maxbarsukov/82085)
[![Dependabot](https://img.shields.io/badge/dependabot-enabled-success.svg)](https://dependabot.com)

https://github.com/maxbarsukov/shoeshop
# ShoeShop

> Простое, но полнофункциональное приложение для интернет-магазина, 
> созданное с помощью **Ruby on Rails 5**.

Это приложение представляет собой магазин с функциями, близкими к реальным.

Пользователь может добавлять товары в корзину и покупать, перемещаться по категориям и брендам, искать, фильтровать и сортировать товары.
Администратор имеет возможность управлять продуктами, добавлять и изменять их, а также имеет доступ к API и странице администратора.

Вы можете перейти на [веб-сайт](https://shoeeshop.herokuapp.com/) или просмотреть изображения в [docs/images](https://github.com/maxbarsukov/shoeshop/tree/master/docs/ изображения) папка

## Functionality included

- Зарегистрируйтесь/войдите/забыли пароль
- Авторизоваться с помощью Фэйсбука
- Фильтровать товары по категориям и брендам
- Добавляйте товары в корзину
- Поиск товаров с помощью автозаполнения
- Просмотр связанных и недавних продуктов
- Пагинация продукта
- Используйте API приложения, если администратор предоставил вам UID и секретный код.
- Страница администратора
- Поставщик OAuth 2

## About the code

- Построен на `Ruby 2.7.2` и `Rails 5.2.3`.
- Использование `Boostrap 3` и собственных таблиц стилей для стилей.
- `Devise` как решение для аутентификации
- `Pundit` для авторизации
- `Pagy` для нумерации страниц.
- `rails_admin` для страницы администратора
- `HAML` как шаблонизатор для HTML.
- `CoffeeScript` вместо JS в скриптах
- Использование `jQuery` и плагинов: `easydropdown`, `responseslides`, `simpleCart`, `typeahead` и т.д.
- `meta-tags` для SEO-оптимизации
- `OmniAuth` обеспечивает аутентификацию с использованием сторонних учетных данных.
- `Doorkeeper` в качестве поставщика OAuth 2 и аутентификатора API.
- `API` создан с помощью `jbuilder` и `active_model_serializers`.
- `Acts-as-tagable-on` для фильтрации продуктов по тегам
- `rack-attack` в качестве промежуточного программного обеспечения для регулирования и блокировки неправомерных запросов.
- `TDD` с `RSpec` + `ShouldaMatchers` + `FactoryBot` + `etc.` (более `110` тестов)
- Инструменты профилирования и оптимизации:
    - `Bullet` как профилировщик проблем `N+1`.
    - `active_record_doctor` помогает поддерживать базу данных в хорошем состоянии
— Сканеры качества кода: `rails_best_practices`, `rubocop`, `rubycritic`, `brakeman`.
- CI/CD
    - `Travis CI`
    - `Coveralls.io` для истории и статистики прохождения тестов.
    - `Hakiri.io` и `GuardRails.io` в качестве сканера уязвимостей безопасности.
- `Docker` и `docker-compose`


## Setup

Клонируем repository:
```
git clone git@github.com:maxbarsukov/shoeshop.git
```
Устанавливаем gems:

`bundle install`

Правим файл `config/database.yml`
```
default: &default
  adapter: postgresql
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000
  username: postgres
  password: ****
  host: localhost
  port: 5432

development:
  <<: *default
  database: yetanothershop_development

test:
  <<: *default
  database: yetanothershop_test

production:
  <<: *default
  database: yetanothershop_production

```
Устанавливаем database и seeds:
```
bundle exec rails db:create db:migrate db:seed
```
Устанавливаем БД для тесирования:
```
bundle exec rails db:test:prepare
```
## Run
Запускаем приложение:

`shoeshop`

Переходим по ссылке:

http://localhost:3000/

With Foreman:
- Dev:
    `foreman start`
- Production:
    `foreman start -f Procfile`

Using Docker: `docker-compose up`

## Testing

Run tests with `rspec`

Check security vulnerability with `bundle exec brakeman --exit-on-warn -f plain -5`

Check the quality of code with `bundle exec rails_best_practices . --spec -c config/rails_best_practices.yml`

Run `bundle exec rubycritic` for code quality reporter

## License

MIT License. Copyright 2023
