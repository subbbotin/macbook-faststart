# 🍎 Настройка нового мака

На случай, если по каким-то причинам не получилось через ассистент миграции, а ставить руками влом.

---

## 🚀 Быстрый старт

```bash
curl -fsSL https://raw.githubusercontent.com/subbbotin/macbook-faststart/master/bootstrap.zsh | zsh
```

или можно скачать файлик и дёрнуть руками:

[📦 Скачать bootstrap.zsh](https://raw.githubusercontent.com/subbbotin/macbook-faststart/master/bootstrap.zsh)

---

## ⚙️ Что делает

- Ставит **Homebrew**, **Command Line Tools** и базовые CLI-утилиты (`git`, `jq`, `fzf`, `tree`, `mas`, …)
- Настраивает **.zshrc** и **.zprofile** (цвета, промпт, алиасы, автодополнение)
- Ставит:
  - 🧠 GitHub Desktop
  - 🛠️ Warp
  - 🐘 Beekeeper Studio
  - 🌐 Viscosity
  - 🎧 Spotify
  - ✏️ Shapr3D
  - 💬 Zulip
  - 🧩 Bambu Studio
  - 🎨 Adobe Creative Cloud
  - 🎨 Figma Desktop
  - 🎧 Yandex Music
- Чистит кеши и делает `brew cleanup`
- (опционально) спрашивает GitHub API token для Homebrew

---

## 🧰 Ручные настройки macOS

Пока оно шарашит, можно вручную протыкать пару штук:

1. 🔤 **Шорткаты:**
   - Spotlight → `Ctrl + Пробел`
   - Переключение раскладки → `⌘ + Пробел`
2. ⌨️ **Скорость реакции клавиатуры:**
   Выкрутить все ползунки на максимум
3. 💻 **Трекпад:**
   Включить касание как клик
4. 💩 **Control Center и Menu Bar:**
   Убрать всякий мусор, запихнуть яркость клавы, блютус, включить отображение заряда в процентах

---

## TODO
- Тема для Zed
- SSH-ключ
