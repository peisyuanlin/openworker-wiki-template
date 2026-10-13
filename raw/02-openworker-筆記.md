# 課堂筆記：OpenWorker

- OpenWorker 是吳恩達（Andrew Ng）和 Rohit Prasad 在 2026 年 7 月 23 日發表的開源 AI 代理，採 MIT 授權。
- 定位是「AI 同事」：不只聊天，而是交出做好的成品，例如文件、Slack 訊息、行事曆更新。
- 本地優先：agent 迴圈、對話紀錄、金鑰都存在自己的電腦上。
- 不綁模型：可以自帶 OpenAI、Anthropic、Google Gemini 等 API 金鑰，也能用 Ollama 跑本地模型。
- 底層是吳恩達團隊的另一個開源專案 aisuite，一個統一各家 LLM 介面的 Python 函式庫。
- 安全設計：寫檔、發訊息、執行指令前都會先問使用者；每次工具呼叫都會記錄下來。
- 目前支援 Apple Silicon 的 Mac 和 Windows 10/11 x64，沒有 Linux 版。
- 本課程使用 Google Gemini 的免費 API 金鑰，同學不需要付費訂閱。
