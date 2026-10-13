# 我的 AI 知識庫（OpenWorker + LLM Wiki）

這個 repo 讓你**不用在自己電腦安裝任何東西**，就能在瀏覽器裡使用 OpenWorker，
並用 Karpathy 的 LLM Wiki 方法建立自己的知識庫。
Mac、Windows、Chromebook、平板都可以，只要有瀏覽器和 GitHub 帳號。

## 你需要準備

1. **GitHub 帳號**（建議申請 [GitHub Education 學生方案](https://education.github.com/pack)，免費時數更多）
2. **Gemini API 金鑰**（免費）：到 <https://aistudio.google.com/apikey> 用個人 Gmail 登入 → Create API key → 複製起來

## 第一次使用（約 10 分鐘）

1. 在這個 repo 頁面右上角按 **Use this template → Create a new repository**，建立你自己的 repo（可以設成 Private）
2. 在**你自己的** repo 頁面按綠色的 **Code** → **Codespaces** 分頁 → **Create codespace on main**
3. 等它自動安裝。下方終端機最後出現「OpenWorker 安裝完成」和「完成！」就好了，**第一次大約 5–10 分鐘**，中途不要關掉分頁
4. 打開 OpenWorker：
   - 通常會自動跳出新分頁
   - 沒有的話：點下方的 **連接埠（PORTS）** 分頁 → 找到 **OpenWorker（1420）** → 按旁邊的 🌐 地球圖示
   - 瀏覽器擋了彈出視窗的話，允許它
5. 在 OpenWorker 裡設定模型：
   - 點右下角的 **No model** → 進到 **Models & Keys**
   - 點 **Gemini (Google)** → 貼上金鑰 → 按 **Test** 確認
   - 回到對話畫面，模型選 **Gemini 3.6 Flash** 或 **Gemini 2.5 Flash**
   - ⚠️ **不要選 Gemini 3.1 Pro**，它不在免費範圍，會出錯

## 第二次以後

到 <https://github.com/codespaces> 找到你的 codespace，點開就好，它會自動啟動 OpenWorker（約 1 分鐘）。
如果 OpenWorker 打不開，在下方終端機輸入：

```bash
bash .devcontainer/start.sh
```

## 開始建立知識庫

OpenWorker 的工作資料夾就是這個 repo，下方的 `wiki` 資料夾選擇器應該已經選好了。

| 資料夾 | 用途 |
|---|---|
| `SCHEMA.md` | 給 AI 讀的維護規則 |
| `raw/` | 你收集的原始資料（AI 只讀不改） |
| `wiki/` | AI 幫你整理的知識頁面 |

依序在 OpenWorker 輸入：

1. `請先完整讀過 SCHEMA.md，之後都照裡面的規則維護這個知識庫。讀完後用三句話告訴我你的工作是什麼。`
2. `匯入 raw/01-llm-wiki-筆記.md`（它寫檔前會請你同意）
3. `匯入 raw/02-openworker-筆記.md`
4. 問問題，例如：`OpenWorker 和 LLM Wiki 可以怎麼搭配？`
5. `健檢`

想加自己的資料：在左側檔案總管對 `raw/` 按右鍵 → 新增檔案，或直接把檔案拖進去，再叫 OpenWorker 匯入。

## 把知識庫存回 GitHub

Codespace 裡的改動要 commit 才會存到你的 repo：
點左側的 **原始檔控制（Source Control）** 圖示 → 寫一句說明 → **Commit** → **Sync Changes**。

## 重要提醒

- 🔒 **連接埠 1420 絕對不要設成 Public**。保持預設的 Private，只有你本人登入 GitHub 才能打開。設成 Public 等於讓任何人用你的金鑰和你的 codespace
- 🔑 金鑰只存在你的 codespace 裡。刪掉 codespace 後要重新貼一次
- ⏱ 不用時 codespace 閒置 30 分鐘會自動停止，不會一直扣時數。也可以到 <https://github.com/codespaces> 手動停止
- 💾 GitHub 免費帳號每月有 120 核心小時（2 核機器約 60 小時）和 15GB 空間。用不到的 codespace 記得刪掉
- 🛡 Gemini 免費方案的內容可能被 Google 用來改進產品，**不要放個資或機密資料**
- ⏳ 看到 429 錯誤代表免費額度暫時用完，等一下或隔天再試

## 疑難排解

| 狀況 | 解法 |
|---|---|
| 一直卡在安裝 | 看下方終端機有沒有紅字錯誤；可以截圖給助教 |
| 打開 1420 是空白或錯誤頁 | 終端機執行 `bash .devcontainer/start.sh`，再重新整理 |
| 顯示 Blocked request | 確認你是從「連接埠」分頁打開的網址 |
| 想看詳細紀錄 | `cat ~/.openworker-logs/server.log` 或 `ui.log` |
